Given /^a proposition set up with (.+) about (?:a )?(.+)$/ do |protocol, subject|
  go_to :proposals_page
  open_new_proposal
  create_proposal :about => subject, :protocol => protocol
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
When /^there are (.*) votes and (.*) votes on (?:the )(.+)$/ do |yes, no, subject|
  (1..(yes.to_i)).each { When "someone votes yes on the #{subject}" }
  (1..(no.to_i)).each { When "someone votes no on the #{subject}" }
end