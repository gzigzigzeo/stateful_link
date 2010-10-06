require 'spec_helper'

describe StatefulLink::Helper do
  before(:each) do
    controller.controller_path = 'foos'
    controller.action_name = 'bar'    
  end

  it "should extract controller and action" do
    helper.extract_controller_and_action("friendships#index").should == ['friendships', 'index']
    helper.extract_controller_and_action("friendships#").should == ['friendships', '']    
  end
  
  it "action_any_of should work" do
    helper.action_any_of?("bars#index").should be_false
    helper.action_any_of?("foos#bar").should be_true
    helper.action_any_of?("bars#index", "foos#bar").should be_true    
  end
  
  it "action_state should work" do
    helper.action_state("bars#index", "foos#bar").should == :chosen
    helper.action_state("bars#index", ["foos#", "foobars#index"]).should == :chosen    
    helper.action_state("foos#bar", "tests#index").should == :active
    helper.action_state("foos#bar").should == :active    
  end
  
  it "should generate stateful links" do
    helper.stateful_link_to(
      "foos#bar",
      :active => "1",
      :inactive => "2",
      :chosen => "3"
    ).should == "1"

    helper.stateful_link_to(
      "bars#foo",
      ["foos#bar", "foobars#*"],
      :active => "1",
      :inactive => "2",
      :chosen => proc { root_path }
    ).should == root_path
    
    helper.stateful_link_to(
      :active => "1",
      :inactive => "2",
      :chosen => "3",
      :state => proc { :active }
    ).should == "1"
  end
end