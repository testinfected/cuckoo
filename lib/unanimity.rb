require 'protocol'

class Unanimity < Protocol

  def to_s
    "Unanimity"
  end
  
  class NoUnanimity < Protocol::Outcome
    def to_s
      "No unanimity"
    end
  end

  def tally(breakdown)
    total = vote_count(breakdown)
    advice = breakdown.select { |choice, count| count == total }.keys[0]
    advice = (advice == nil || total == 0) ? NoUnanimity.new : advice
  end
  
end