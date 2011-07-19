module NewProposalPage
  def create_proposal(proposal)
    proposal[:proposition] ||= ""
    in_scope :within => "#new_proposal" do
      fill_in_fields 'proposal_subject' => proposal[:about], 'proposal_wording' => proposal[:proposition]
      fill_in_fields 'proposal_protocol_class' => proposal[:protocol]
      press 'proposal_submit'
    end
  end
end

World(NewProposalPage)
