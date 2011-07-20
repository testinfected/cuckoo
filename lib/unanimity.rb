require 'protocol'

class Unanimity < Protocol
  class Drop < Protocol::Outcome
    def to_s
      "drop"
    end
  end

  class Adopt < Protocol::Outcome
    def to_s
      "adopt"
    end
  end

  @@choices = [:yes, :no]

  def to_s
    "Unanimity"
  end

  def choices
    @@choices.dup
  end

  def tally(votes)
    has_no?(votes) || votes.empty? ? Drop.new : Adopt.new
  end

  private
  def has_no?(votes)
    votes.detect { |vote| vote == :no }
  end
end