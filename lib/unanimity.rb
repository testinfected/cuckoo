require 'protocol'

class Unanimity < Protocol
  attr_reader :choices

  def initialize
    @choices = [Yes.new, No.new]
  end

  def to_s
    "Unanimity"
  end

  class Yes < Protocol::Choice
    def to_s
      "yes"
    end
  end
  class No < Protocol::Choice
    def to_s
      "no"
    end
  end
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

  def tally(votes)
    has_no?(votes) || votes.empty? ? Drop.new : Adopt.new
  end

  private
  def has_no?(votes)
    votes.detect { |vote| vote.value == No.new.to_s }
  end
end
