require "spec_helper"

def yes_vote
  Vote.make(:value => Unanimity::Yes.new.to_s)
end

def no_vote
  Vote.make(:value => Unanimity::No.new.to_s)
end

describe Unanimity do

  context "when there is no vote" do
    let(:no_vote) { [] }

    it "suggests to drop proposal" do
      subject.tally(no_vote).should be_kind_of(Unanimity::Drop)
    end
  end

  context "when there are only yes votes" do
    let(:votes) { [yes_vote, yes_vote, yes_vote] }

    it "suggests to adopt proposal" do
      subject.tally(votes).should be_kind_of(Unanimity::Adopt)
    end
  end

  context "when there is a no vote" do
    let(:votes) { [yes_vote, no_vote, yes_vote] }

    it "suggests to drop proposal" do
      subject.tally(votes).should be_kind_of(Unanimity::Drop)
    end
  end

  it "exposes yes and no choice" do
    subject.choices[0].should be_kind_of(Unanimity::Yes)
    subject.choices[1].should be_kind_of(Unanimity::No)
    Unanimity::Yes.new.to_s.should == "yes"
    Unanimity::No.new.to_s.should == "no"
  end
end