require "spec_helper"

describe Unanimity do

  it "gives the choice of yes or no" do
    subject.choices[0].should be_kind_of(Unanimity::Yes)
    subject.choices[1].should be_kind_of(Unanimity::No)
    Unanimity::Yes.new.to_s.should == "yes"
    Unanimity::No.new.to_s.should == "no"
  end

  context "without any vote" do
    let(:no_vote) { [] }

    it "suggests to drop proposal" do
      subject.tally(no_vote).should be_kind_of(Unanimity::Drop)
    end
  end

  context "with only yes votes" do
    let(:votes) { [Vote.make(:yes), Vote.make(:yes), Vote.make(:yes)] }

    it "suggests to adopt proposal" do
      subject.tally(votes).should be_kind_of(Unanimity::Adopt)
    end
  end

  context "with at least one no vote" do
    let(:votes) { [Vote.make(:yes), Vote.make(:no), Vote.make(:yes)] }

    it "suggests to drop proposal" do
      subject.tally(votes).should be_kind_of(Unanimity::Drop)
    end
  end
end