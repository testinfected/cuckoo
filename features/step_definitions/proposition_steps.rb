Given /^a proposal about (.+)$/ do |subject|
  Given "a proposition set up with Unanimity about #{subject}"
end

Given /^a proposition set up with (.+) about (?:a )?(.+)$/ do |protocol, subject|
  go_to :proposals_page
  open_new_proposal
  create_proposal :about => subject, :protocol => protocol, :proposition => ""
end

Given /^the following available choices on (?:the )?(.+)$/ do |subject, table|
  table.rows.each { |choice| 
    go_to :proposals_page
    view_proposal :about => subject
    add_choice choice
  }
end
When /^there are the following votes on (?:the )?(.+)$/ do |subject, table|
  table.rows.each { |choice, number|
    number.to_i.times {
      go_to :proposals_page
      participate_in_vote :about => subject
      cast_vote choice
    }
  }
end
Then /^the outcome of the proposition about (?:the )?(.+) is "([^"]*)"$/ do |subject, suggested|
  go_to :proposals_page
  should_see_proposal_outcome suggested, :about => subject
end


When /^there is no vote on (?:the )?(.+)$/ do |subject|
  # do nothing
end

When /^someone votes (.+) on (?:the )?(.+)$/ do |choice, subject|
  go_to :proposals_page
  participate_in_vote :about => subject
  cast_vote choice
end

When /^there are (.*) votes and (.*) votes on (?:the )?(.+)$/ do |yes, no, subject|
  yes.to_i.times { When "someone votes yes on the #{subject}" }
  no.to_i.times { When "someone votes no on the #{subject}" }
end

When /^(?:.+|I) share(?:s)? the proposal about (?:the )?(.+)$/ do |subject|
  go_to :proposals_page
  view_proposal :about => subject
  share_proposal
end

When /^(?:.+|I) use(?:s)? (?:the )?(.+) guest pass$/ do |subject|
  go_to_page "#{subject} guest pass link"
end

Then /^(?:.+|I) see(?:s)? the voting page on (?:the )?(.+)$/ do |subject|
  should_see_proposal_subject subject
end