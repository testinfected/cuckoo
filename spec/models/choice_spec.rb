require 'spec_helper'

describe Choice do
  
  it "is described by a label" do
    Choice.new.should respond_to(:label)
  end
  
  specify "string representation" do
    Choice.make(:label=>'example').to_s.should == 'example'
  end
  
  it { should belong_to(:proposal) }
  
end
