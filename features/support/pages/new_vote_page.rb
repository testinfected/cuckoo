module NewVotePage
  def should_see_proposal_subject(subject)
    should_see subject, :within => '.subject'
  end

  def cast_vote(vote)
    press vote
  end
end

World(NewVotePage)
