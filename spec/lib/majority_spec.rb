require "rspec"

describe Majority do

  specify "string representation" do
    subject.to_s.should == "Majority"
  end

  it "should gives the choice of yes or no" do
    subject.choices[0].should be_kind_of(Majority::Yes)
    subject.choices[1].should be_kind_of(Majority::No)
    Majority::Yes.new.to_s.should == "yes"
    Majority::No.new.to_s.should == "no"
  end

  context "without any vote" do
    let(:no_vote) { [] }

    it "suggests to drop proposal" do
      subject.tally(no_vote).should be_kind_of(Majority::Drop)
    end
  end

  context "with a majority of yes" do
    let(:yes_votes) { [Vote.make(:yes), Vote.make(:yes), Vote.make(:no)] }

    it "suggests to adopt the proposal" do
      subject.tally(yes_votes).should be_kind_of(Majority::Adopt)
    end
  end

  context "with a majority of no" do
    let(:no_votes) { [Vote.make(:no), Vote.make(:yes), Vote.make(:no)]}

    it "suggests to drop the proposal" do
      subject.tally(no_votes).should be_kind_of(Majority::Drop)
    end
  end

  context "with same number of no and yes" do
    let(:votes) { [Vote.make(:yes), Vote.make(:no)] }

    it "suggests to drop the proposal" do
      subject.tally(votes).should be_kind_of(Majority::Drop)
    end
  end

end