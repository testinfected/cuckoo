require 'protocol'

class Majority < Protocol
  attr_reader :choices

  def to_s
    "Majority"
  end

  def initialize
    @choices = [Yes.new, No.new]
  end

  def tally(votes)
    yes = votes.select { |vote| vote.value == Yes.new.to_s }
    no = votes.select { |vote| vote.value == No.new.to_s }
    yes.size > no.size ? Adopt.new : Drop.new
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

end