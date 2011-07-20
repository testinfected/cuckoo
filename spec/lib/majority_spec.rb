require "spec_helper"

describe Majority do

  specify "string representation" do
    subject.to_s.should == "Majority"
  end

  it "gives the choice of yes or no" do
    subject.choices.should == [:yes, :no]
  end

  context "without any vote" do
    let(:no_vote) { [] }

    it "suggests to drop proposal" do
      subject.tally(no_vote).should be_kind_of(Majority::Drop)
    end
  end

  context "with a majority of yes" do
    let(:majority_of_yeses) { [:yes, :no, :yes] }

    it "suggests to adopt the proposal" do
      subject.tally(majority_of_yeses).should be_kind_of(Majority::Adopt)
    end
  end

  context "with a majority of no" do
    let(:majority_of_nos) { [:no, :yes, :no]}

    it "suggests to drop the proposal" do
      subject.tally(majority_of_nos).should be_kind_of(Majority::Drop)
    end
  end

  context "with equal number of yes and no" do
    let(:split_vote) { [:yes, :no] }

    it "suggests to drop the proposal" do
      subject.tally(split_vote).should be_kind_of(Majority::Drop)
    end
  end

end