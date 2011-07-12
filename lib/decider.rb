require 'protocol'

class Decider < Protocol

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
