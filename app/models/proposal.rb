require 'decider'

class Proposal < ActiveRecord::Base
  def clear_votes

  end

  def outcome(protocol = Decider.new)
    protocol.tally([])
  end
end
