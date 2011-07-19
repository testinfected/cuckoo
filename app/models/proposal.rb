require 'unanimity'

class Proposal < ActiveRecord::Base
  has_many :votes

  def protocol
    self.protocol_class==nil ? Unanimity.new : Object::const_get(self.protocol_class).new()
  end

  def outcome
    protocol.tally(self.votes)
  end

  def breakdown
    votes_breakdown = {}
    protocol.choices.each { |choice|
      votes_breakdown[choice.to_s] = 0
    }
    self.votes.each { |vote|
      votes_breakdown[vote.value.to_s] += 1 if vote.value != nil
    }
    votes_breakdown
  end
end
