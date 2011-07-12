require 'protocol'

class Decider < Protocol
  class Drop < Protocol::Outcome
  end

  def tally(votes)
    Drop.new
  end
end
