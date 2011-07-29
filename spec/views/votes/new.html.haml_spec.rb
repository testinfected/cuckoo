require 'spec_helper'

describe "votes/new.html.haml" do

  before(:each) do
    @proposal = stub_model(Proposal, :breakdown => {:first => 1, :second => 0}, :choices => ["first", "second"])
    assign(:proposal, @proposal)
    assign(:vote, Vote.make)
    render
  end

  it "displays proposal details" do
    rendered.should have_content(@proposal.subject)
    rendered.should have_content(@proposal.wording)
    rendered.should match_selector(".results") do |results|
      results.should contain("1 first")
      results.should contain("0 second")
    end
  end

  specify "voting options depends on protocol" do
    rendered.should have_selector("form", :action => proposal_votes_path(@proposal), :method => 'post') do |form|
      form.should have_selector("input[type=submit][value=first]#first")
      form.should have_selector("input[type=submit][value=second]#second")
    end
  end
end