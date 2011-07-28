require 'spec_helper'

describe Vote do
  it { should belong_to(:proposal) }

  # todo: add round trip test
end
