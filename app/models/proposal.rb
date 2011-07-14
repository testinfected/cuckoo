require 'unanimity'

class Proposal < ActiveRecord::Base
  has_many :votes

  def protocol
    Unanimity.new
  end

  def outcome
    protocol.tally(self.votes)
  end
end
