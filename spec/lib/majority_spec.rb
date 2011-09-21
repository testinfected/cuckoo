require "spec_helper"

describe Majority do

  specify "string representation" do
    subject.to_s.should == "Majority"
  end
  
  specify "No majority label" do
    Majority::NoMajority.new.to_s.should == "No majority"
  end

  context "without any vote" do
    let(:no_vote) { {:yes=>0, :no=>0} }

    it "cannot find a majority" do
      subject.tally(no_vote).should be_kind_of(Majority::NoMajority)
    end
  end
  
  context "with one single vote" do
    let(:one_vote) { { :yes=>1, :no=>0 }}
    
    it "suggest to follow this single vote" do
      subject.tally(one_vote).should == :yes
    end
  end

  context "with a majority between two choices" do
    let(:a_majority) { {:yes=>10, :no=>11} }

    it "suggests to follow the advice of the majority" do
      subject.tally(a_majority).should == :no
    end
  end
  
  context "with a floating vote between two choices" do
    let(:a_floating) { {:yes=>10, :no=>10} }

    it "suggests to wait for more votes" do
      subject.tally(a_floating).should be_kind_of(Majority::NoMajority)
    end
  end
  
  context "with a majority between three choices" do
    let(:a_majority) { {:red=>20, :green=>20, :blue=>60} }

    it "suggests to follow the advice of the majority" do
      subject.tally(a_majority).should == :blue
    end
  end
  
  context "with no majority between three choices" do
    let(:no_majority) { {:red=>20, :green=>20, :blue=>30} }

    it "suggests to wait for more votes" do
      subject.tally(no_majority).should be_kind_of(Majority::NoMajority)
    end
  end
  
  describe "algorithm" do
    let(:votes) { {:red=>20, :green=>20, :blue=>30} }
    
    it "computes the total vote number" do
      subject.vote_count(votes).should == 70
    end
  end
  

end