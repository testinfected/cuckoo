require 'Decider'

class Proposal < ActiveRecord::Base
  has_many :votes

  def outcome(protocol = Decider.new)
    protocol.tally(self.votes)
  end
end
