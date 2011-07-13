require 'spec_helper'

describe "proposals/index.html.haml" do

  context "when a proposal exists" do
    before(:each) do
      assign(:proposals, [@proposal = Proposal.make(:id => 1234)])
      render
    end

    it "displays column headings on proposal table" do
      rendered.should have_selector("#proposals > tr th", :count => 2)
      rendered.should match_selector("#proposals > tr th") do |subject, outcome|
        subject.should have_content("Subject")
        outcome.should have_content("Outcome")
      end
    end

    it "displays proposal details in columns" do
      rendered.should have_selector("tr#proposal_1234 td", :count => 3)
      rendered.should match_selector("tr#proposal_1234 td") do |subject, outcome, vote|
        subject.should contain(@proposal.subject)
        subject.should have_selector("a", :href => proposal_path(@proposal))
        outcome.should contain(@proposal.outcome.to_s)
        vote.should have_selector("a", :href => new_proposal_vote_path(@proposal))
      end
    end
  end

  context "when there are several proposals" do
    before(:each) do
      assign(:proposals, @proposals = [Proposal.make(:id => 1), Proposal.make(:id => 2), Proposal.make(:id => 3)])
      render
    end

    it "should display one proposal per line" do
      rendered.should have_selector("tr[id^='proposal_']", :count => @proposals.size)
    end
  end
end
