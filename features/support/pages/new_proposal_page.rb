module NewProposalPage
  def create_proposal(proposal)
    #todo: use machinist to make a proposal and merge in parameters
    proposal[:proposition] ||= ""
    proposal[:protocol] ||= "Unanimity"
    in_scope :within => "#new_proposal" do
      fill_in_fields 'proposal_subject' => proposal[:about],
                     'proposal_wording' => proposal[:proposition],
                     'proposal_protocol_class' => proposal[:protocol]
      press 'proposal_submit'
    end
  end
end

World(NewProposalPage)
