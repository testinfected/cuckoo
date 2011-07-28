module ProposalIndexPage
  def open_new_proposal
    follow 'New proposal'
  end

  def view_proposal(proposal)
    follow proposal[:about], :within => row_for(proposal)
  end

  def should_see_proposal_outcome(outcome, proposal)
    should_see outcome, :within => row_for(proposal)
  end

  def participate_in_vote(proposal)
    follow "Vote", :within => row_for(proposal)
  end

  private
  def last(proposal)
    Proposal.find_last_by_subject(proposal[:about])
  end

  def row_for(proposal)
    "tr#proposal_#{last(proposal).id}"
  end
end

World(ProposalIndexPage)