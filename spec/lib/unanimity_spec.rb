require "spec_helper"

describe Unanimity do

  specify "string representation" do
    subject.to_s.should == "Unanimity"
  end

  it "gives the choice of yes or no" do
    subject.choices.should == [:yes, :no]
  end

  context "without any vote" do
    let(:no_vote) { [] }

    it "suggests to drop proposal" do
      subject.tally(no_vote).should be_kind_of(Unanimity::Drop)
    end
  end

  context "with only yes votes" do
    let(:votes) { [:yes, :yes, :yes] }

    it "suggests to adopt proposal" do
      subject.tally(votes).should be_kind_of(Unanimity::Adopt)
    end
  end

  context "with at least one no vote" do
    let(:votes) { [:yes, :no, :yes] }

    it "suggests to drop proposal" do
      subject.tally(votes).should be_kind_of(Unanimity::Drop)
    end
  end
end