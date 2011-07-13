require 'spec_helper'

describe "votes/new.html.haml" do

  before(:each) do
    assign(:proposal, @proposal = Proposal.make(:id => 1234))
    assign(:vote, @vote = @proposal.votes.build)
    @proposal.stub_chain(:protocol, :choice, :to_s).and_return("choice")
    render
  end

  it "displays the proposal" do
    rendered.should have_content(@proposal.subject)
    rendered.should have_content(@proposal.wording)
  end

  it "exposes proposal's protocol choice to vote" do
    rendered.should have_selector("form", :action => proposal_votes_path(@proposal), :method => 'post') do |form|
      form.should have_selector("input[type=submit][value=choice]#choice")
    end
  end
end