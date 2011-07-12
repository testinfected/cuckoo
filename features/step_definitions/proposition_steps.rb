Given /^a proposition about "(.+)"$/ do |subject|
  go_to :new_proposal_page
  create_proposal(subject)
end

When /^there is no vote on "(.+)"$/ do |subject|
  # do nothing
end

Then /^the outcome is to drop "(.+)"$/ do |subject|
  go_to :proposals_page
  should_show_proposal_outcome(subject, "drop")
end