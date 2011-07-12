module ProposalsPage
  def should_show_proposal_outcome(outcome, proposal)
    proposal = Proposal.find_last_by_subject(proposal[:about])
    should_see outcome, :within => "tr#proposal_#{proposal.id}"
  end

  def participate_in_vote(proposal)
    proposal = Proposal.find_last_by_subject(proposal[:about])
    follow "vote", :within => "tr#proposal_#{proposal.id}"
  end
end

World(ProposalsPage)