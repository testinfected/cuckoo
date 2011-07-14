require "spec_helper"

describe Decider do

  context "when there is no vote" do
    let(:no_vote) { [] }

    it "suggests to drop proposal" do
      subject.tally(no_vote).should be_kind_of(Decider::Drop)
    end
  end

  context "when votes have been cast" do
    let(:votes) { [Vote.make, Vote.make, Vote.make] }

    it "suggests to adopt proposal" do
      subject.tally(votes).should be_kind_of(Decider::Adopt)
    end
  end

  it "exposes yes and no choice" do
    subject.choices[0].should be_kind_of(Decider::Yes)
    subject.choices[1].should be_kind_of(Decider::No)
    Decider::Yes.new.to_s.should == "yes"
    Decider::No.new.to_s.should == "no"
  end
end