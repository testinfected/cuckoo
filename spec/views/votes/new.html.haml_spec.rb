require 'spec_helper'

describe "votes/new.html.haml" do

  before(:each) do
    assign(:proposal, @proposal = Proposal.make(:id => 1234))
    assign(:vote, @vote = @proposal.votes.build)
    render
  end

  it "displays the proposal" do
    rendered.should have_content(@proposal.subject)
    rendered.should have_content(@proposal.wording)
  end

  it "has a button to vote yes on proposal" do
    rendered.should have_selector("form", :action => proposal_votes_path(@proposal), :method => 'post') do |form|
      form.should have_selector("input[type=submit]#yes")
    end
  end
end