require 'protocol'

class Majority < Protocol
  def to_s
    "Majority"
  end

  class NoMajority < Protocol::Outcome
    def to_s
      "No majority"
    end
  end

  def tally(breakdown)
    fifty_percent = vote_count(breakdown)/2
    advice = breakdown.select { |choice, count| count > fifty_percent }.keys[0]
    advice = advice == nil ? NoMajority.new : advice
  end
  
end