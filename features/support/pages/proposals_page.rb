module ProposalsPage
  def should_show_proposal_outcome(subject, outcome)
    proposal = Proposal.find_last_by_subject(subject)
    within("#proposal_#{proposal.id}") do
      page.should have_content(outcome)
    end
  end
end

World(ProposalsPage)