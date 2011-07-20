require 'spec_helper'

describe Proposal do

  it { should have_db_column(:wording) }
  it { should have_many(:votes) }
  it { should have_db_column(:protocol_class) }

  it "can build an instance of the protocol" do
    proposal = Proposal.make(:protocol_class => Unanimity.new.to_s)
    proposal.protocol.should be_kind_of(Unanimity)
  end

  specify "default protocol is Unanimity" do
    subject.protocol.should be_kind_of(Unanimity)
  end

  describe "breakdown of votes" do

    specify "with no vote" do
      subject.breakdown.should == { "no" => 0, "yes" => 0 }
    end

    specify "with one vote" do
      subject.votes = [Vote.make!(:yes)]
      subject.breakdown.should == { "yes" => 1, "no" => 0 }
    end

    specify "with several votes" do
      subject.votes = [Vote.make!(:yes), Vote.make!(:yes), Vote.make!(:no)]
      subject.breakdown.should == { "yes" => 2, "no" => 1 }
    end
  end
end