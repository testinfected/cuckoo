require 'protocol'

class Majority < Protocol
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

  def choices
    @@choices.dup
  end

  def to_s
    "Majority"
  end

  def tally(votes)
    yes = votes.select { |vote| vote == :yes }
    no = votes.select { |vote| vote == :no }
    yes.size > no.size ? Adopt.new : Drop.new
  end
end