require 'spec_helper'

describe "proposals/index.html.haml" do

  before(:each) do
    @proposal = Proposal.make!
    assign(:proposals, [@proposal])
    render
  end

  specify "subject should link to the proposal" do
    rendered.should have_selector("td.subject") do |td|
      td.should have_selector("a", :href=> proposal_path(@proposal))
    end
  end

  it "should display the outcome of a proposal" do
    rendered.should have_selector("td.outcome") do |td|
      td.should contain(@proposal.outcome.to_s)
    end
  end

  specify "have a link to vote" do
    rendered.should have_selector("td.vote") do |td|
      td.should have_selector("a", :href=> new_proposal_vote_path(@proposal))
    end
  end

end
