require 'spec_helper'

describe ApplicationController do
  it "should extract controller and action" do    
    subject.extract_controller_and_action("friendships#index").should == ['friendships', 'index']
    subject.extract_controller_and_action("friendships#").should == ['friendships', '']    
  end
  
  it "action_any_of should work" do
    get :index
    subject.action_any_of?("bars#index").should be_false
    subject.action_any_of?("application#index").should be_true
    subject.action_any_of?("bars#index", "application#index").should be_true    
  end
  
  it "action_state should work" do
    get :index
    subject.action_state("bars#index", "application#index").should == :chosen
    subject.action_state("bars#index", ["application#index", "foobars#index"]).should == :chosen    
    subject.action_state("application#index", "tests#index").should == :active
    subject.action_state("application#index").should == :active    
  end  
end
