require 'spec_helper'

def yes_vote
  Vote.make(:value => "yes")
end
def no_vote
  Vote.make(:value => "no")
end

describe Proposal do

  specify "protocol" do
    subject.protocol.should be_kind_of(Unanimity)
  end

  describe "breakdown" do

    specify "when no votes" do
      subject.breakdown.should == { "no" => 0, "yes" => 0}
    end

    specify "when one vote" do
      votes = [ yes_vote ]
      subject.should_receive(:votes).and_return(votes)
      subject.breakdown.should == { "yes" => 1, "no" => 0}
    end

    specify "when several votes" do
      votes = [yes_vote, yes_vote, no_vote]
      subject.should_receive(:votes).and_return(votes)
      subject.breakdown.should == { "yes" => 2, "no" => 1}
    end

  end

end