require 'unanimity'

class Proposal < ActiveRecord::Base
  cattr_accessor :default_protocol do
    Unanimity.name
  end

  has_many :votes
  has_one :guest_pass
  has_many :choices

  def protocol
    (protocol_class || Proposal.default_protocol).constantize.new
  end

  def shared?
    !guest_pass.nil?
  end

  def guest_pass_token
    guest_pass.try(:token)
  end

  def outcome
    protocol.tally(breakdown)
  end

  def breakdown
    choices.each_with_object({}) { |choice, breakdown| breakdown[choice] = votes.cast_as(choice).count }
  end
end
