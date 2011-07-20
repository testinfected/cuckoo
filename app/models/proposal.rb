require 'unanimity'

class Proposal < ActiveRecord::Base
  has_many :votes

  def protocol
    self.protocol_class==nil ? Unanimity.new : Object::const_get(self.protocol_class).new()
  end

  def outcome
    protocol.tally(votes)
  end

  def choices
    protocol.choices
  end

  def breakdown
    choices.each_with_object({}) { |choice, breakdown| breakdown[choice.to_s] = votes.cast_as(choice).count }
  end
end
