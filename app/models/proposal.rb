require 'Decider'

class Proposal < ActiveRecord::Base
  has_many :votes

  def protocol
    Decider.new
  end

  def outcome
    protocol.tally(self.votes)
  end
end
