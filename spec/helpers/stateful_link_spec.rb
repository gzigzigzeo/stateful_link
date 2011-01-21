require 'spec_helper'

describe StatefulLink::Helper do
  before(:each) do
    ActionView::Base.send(:include, StatefulLink::ActionAnyOf)
    controller.controller_path = 'foos'
    controller.action_name = 'bar'
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

    # Check for controller#*
    helper.stateful_link_to(
      "bars#foo",
      ["foos#trala", "foos#*"],
      :active => "1",
      :inactive => "2",
      :chosen => "3"
    ).should == "3"
    
    helper.stateful_link_to(
      :active => "1",
      :inactive => "2",
      :chosen => "3",
      :state => proc { :active }
    ).should == "1"

    helper.stateful_link_to(
      :active => "1",
      :inactive => "2",
      :chosen => "3",
      :state => proc { false }
    ).should == "2"
  end
end
