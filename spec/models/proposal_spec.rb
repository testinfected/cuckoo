require 'spec_helper'

describe Proposal do

  it { should have_many(:votes) }

  specify "default protocol should be unanimity" do
    subject.protocol.should be_kind_of(Unanimity)
  end

  describe "breakdown of votes" do

    specify "with no vote" do
      subject.breakdown.should == { "no" => 0, "yes" => 0 }
    end

    specify "with one vote" do
      subject.votes = [Vote.make(:yes)]
      subject.breakdown.should == { "yes" => 1, "no" => 0 }
    end

    specify "with several votes" do
      subject.votes = [Vote.make(:yes), Vote.make(:yes), Vote.make(:no)]
      subject.breakdown.should == { "yes" => 2, "no" => 1 }
    end
  end
end