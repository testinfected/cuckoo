require 'protocol'

class Decider < Protocol


  attr_reader :choices

  def initialize
    @choices = [Yes.new, No.new]
  end

  def choice
    @choices[0]
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
    votes.empty? ? Drop.new : Adopt.new
  end
end
