require 'protocol'

class Decider < Protocol
  class Drop < Protocol::Outcome
    def to_s
      "drop"
    end
  end

  def tally(votes)
    Drop.new
  end
end
