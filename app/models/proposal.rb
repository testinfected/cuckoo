class Proposal < ActiveRecord::Base
  def clear_votes

  end
  
  def outcome_using(protocol)
    protocol.tally([])
  end
end
