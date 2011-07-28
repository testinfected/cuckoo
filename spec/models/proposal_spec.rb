require 'spec_helper'

describe Proposal do

  # todo: Replace with real round tripping
  # so we know we can save and retrieve with same persistent state
  describe "attributes" do
    it { should have_db_column(:wording) }
    it { should have_many(:votes) }
    it { should have_one(:guest_pass) }
    it { should have_db_column(:protocol_class) }
  end

  describe "by default" do
    it "uses the Unanimity protocol" do
      subject.protocol.should be_kind_of(Unanimity)
    end
  end

  describe "with no guest pass" do
    before { subject.guest_pass = nil }

    it "indicates it is not shared" do
      subject.should_not be_shared
      subject.guest_pass_token.should be_nil
    end
  end

  describe "with a guest pass" do
    before do
       subject.guest_pass = GuestPass.make(:token => 'super-secret-token')
    end

    it "indicates it is shared" do
      subject.should be_shared
      subject.guest_pass_token.should eq('super-secret-token')
    end
  end

  describe "breakdown of votes" do
    specify "with no vote" do
      subject.breakdown.should == { :no => 0, :yes => 0 }
    end

    specify "with one vote" do
      subject.votes = [Vote.make!(:yes)]
      subject.breakdown.should == { :yes => 1, :no => 0 }
    end

    specify "with several votes" do
      subject.votes = [Vote.make!(:yes), Vote.make!(:yes), Vote.make!(:no)]
      subject.breakdown.should == { :yes => 2, :no => 1 }
    end
  end
end