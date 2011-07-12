require 'spec_helper'

describe Proposal do

  it { should have_many(:votes) }

end
