Given /^a proposition about (?:a )?(.+)$/ do |subject|
  go_to :proposals_page
  open_new_proposal
  create_proposal :about => subject
end

When /^there is no vote on (?:the )(.+)$/ do |subject|
  # do nothing
end

Then /^the outcome is to (.+) the proposition about (?:the )(.+)$/ do |suggested, subject|
  go_to :proposals_page
  should_show_proposal_outcome suggested, :about => subject
end

When /^someone votes (.+) on (?:the )(.+)$/ do |choice, subject|
  go_to :proposals_page
  participate_in_vote :about => subject
  cast_vote choice
end