require 'spec_helper'

describe Proposal do

  specify "protocol" do
    subject.protocol.should be_kind_of(Decider)
  end

end