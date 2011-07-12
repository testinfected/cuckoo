require 'spec_helper'

describe "votes/new.html.haml" do

  before(:each) do
    @proposal = Proposal.make!
    @vote = @proposal.votes.build
    assigns[:proposal] = @proposal
    assigns[:vote] = @vote
    render
  end

  it "should remind the proposal" do
    rendered.should have_content(@proposal.subject)
    rendered.should have_content(@proposal.wording)
  end

  it "should have a button to vote yes" do
    rendered.should have_selector("input", :id=>"yes", :value=>"yes")
  end

end