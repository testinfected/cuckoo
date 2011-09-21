require "spec_helper"

describe Unanimity do

  specify "string representation" do
    subject.to_s.should == "Unanimity"
  end
  
  specify "No unanimity label" do
    Unanimity::NoUnanimity.new.to_s.should == "No unanimity"
  end
  
  context "without any vote" do
    let(:no_vote) { {:yes=>0, :no=>0} }

    it "cannot find unanimity" do
      subject.tally(no_vote).should be_kind_of(Unanimity::NoUnanimity)
    end
  end
  
  context "with one single represented choice" do
    let(:one_vote) { { :yes=>2, :no=>0 }}
    
    it "suggest to follow this single vote" do
      subject.tally(one_vote).should == :yes
    end
  end

  context "with several represented choices" do
    let(:votes) { {:yes=>10, :no=>11} }

    it "cannot find unanimity" do
      subject.tally(votes).should be_kind_of(Unanimity::NoUnanimity)
    end
  end


end