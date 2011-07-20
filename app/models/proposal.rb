require 'unanimity'

class Proposal < ActiveRecord::Base
  has_many :votes

  delegate :choices, :to => :protocol

  def protocol
    self.protocol_class==nil ? Unanimity.new : Object::const_get(self.protocol_class).new()
  end

  def outcome
    protocol.tally(votes.collect { |v| v.choice })
  end

  def breakdown
    choices.each_with_object({}) { |choice, breakdown| breakdown[choice] = votes.cast_as(choice).count }
  end
end
