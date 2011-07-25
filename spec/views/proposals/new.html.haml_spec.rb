require "spec_helper"

describe "proposals/new.html.haml" do

  before(:each) do
    assign(:proposal, Proposal.make)
    assign(:protocols, ["one", "two"])
    render
  end

  describe "#new_proposal form" do
    it "POSTs to create a new proposal" do
      rendered.should have_selector("form#new_proposal", :action => proposals_path(@proposal), :method => 'post') do |form|
        form.should have_selector("input", :type => 'submit')
      end
    end

    specify "subject is an input text" do
      rendered.should have_selector("#new_proposal input#proposal_subject", :type => 'text', :name => 'proposal[subject]')
    end

    specify "wording is a textarea" do
      rendered.should have_selector("#new_proposal textarea#proposal_wording", :name => 'proposal[wording]')
    end

    it "lists all available protocols for selection" do
      rendered.should have_selector("#new_proposal select#proposal_protocol_class")
      rendered.should match_selector("#proposal_protocol_class") do |options|
        options.should have_selector("option", :count => 3)
        options.should have_selector("option", :value=>'')
        options.should have_selector("option", :value=>'one')
        options.should have_selector("option", :value=>'two')
      end
    end
  end
end