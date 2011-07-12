Given /^a proposition$/ do
  @proposal = Proposal.make!
end

When /^there is no vote$/ do
  @proposal.clear_votes
end

Then /^the outcome is to drop the proposition$/ do
  @proposal.outcome_using(Decider.new).should be_a(Decider::Drop)
end