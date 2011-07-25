require 'unanimity'

class Proposal < ActiveRecord::Base
  cattr_accessor :default_protocol do
    Unanimity.name
  end

  has_many :votes
  delegate :choices, :to => :protocol

  def protocol
    (protocol_class || Proposal.default_protocol).constantize.new
  end

  def outcome
    protocol.tally(votes.collect { |v| v.choice })
  end

  def breakdown
    choices.each_with_object({}) { |choice, breakdown| breakdown[choice] = votes.cast_as(choice).count }
  end
end
