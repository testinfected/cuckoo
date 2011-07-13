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

  it "exposes yes choice" do
    subject.choice.should be_kind_of(Decider::Yes)
    Decider::Yes.new.to_s.should == "yes"
  end
end