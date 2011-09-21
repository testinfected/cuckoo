module ProposalPage
  def share_proposal
    press 'Share'
  end
  def add_choice(choice)
    fill_in_fields "choice_label" => choice
    press 'Add this choice'
  end
  
end

World(ProposalPage)