require 'spec_helper'

describe "proposals/index.html.haml" do

  context "always" do
    before(:each) do
      assign(:proposals, [])
      render
    end
    
    it "offers a way to create a new proposal" do
      rendered.should match_selector("a", :href => new_proposal_path()) do |link|
        link.should have_content("New proposal")
      end
    end
  end

  context "when a proposal exists" do
    before(:each) do
      assign(:proposals, [@proposal = stub_model(Proposal, :id => 1234, :subject => 'Adoption of a cat', :protocol => 'majority', :outcome => 'drop')])
      render
    end

    it "displays column headings on proposal table" do
      rendered.should have_selector("#proposals > tr th", :count => 3)
      rendered.should match_selector("#proposals > tr th") do |subject, protocol, outcome|
        subject.should have_content("Subject")
        protocol.should have_content("Protocol")
        outcome.should have_content("Outcome")
      end
    end

    it "displays proposal details in columns" do
      rendered.should have_selector("tr#proposal_1234 td", :count => 4)
      rendered.should match_selector("tr#proposal_1234 td") do |subject, protocol, outcome, vote|
        subject.should contain('Adoption of a cat')
        subject.should have_selector("a", :href => proposal_path(@proposal))
        protocol.should contain('majority')
        outcome.should contain('drop')
        vote.should have_selector("a", :href => new_proposal_vote_path(@proposal))
      end
    end
  end

  context "when there are several proposals" do
    before(:each) do
      assign(:proposals, @proposals = [stub_model(Proposal), stub_model(Proposal), stub_model(Proposal)])
      render
    end

    it "should display one proposal per line" do
      rendered.should have_selector("tr[id^='proposal_']", :count => @proposals.size)
    end
  end
end
