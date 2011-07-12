module NewProposalPage
  def create_proposal(subject, wording = 'this is what I propose')
    within('#new_proposal') do
      fill_in 'proposal_subject', :with => subject
      fill_in 'proposal_wording', :with => wording
      click_button 'proposal_submit'
    end
  end
end

World(NewProposalPage)