require 'spec_helper'

describe "proposals/show.html.haml" do

  before do
    assign(:choice, Choice.make)
  end

  describe "proposal details" do
    before do
      assign(:proposal, @proposal = stub_model(Proposal, 
                :subject => 'For lunch', 
                :wording => "Let's have a sandwich", 
                :choices => [Choice.make(:label=>'a choice for fun')]
                  ))
      render
    end
    
    it "offers a way to go back to the proposal list" do
      rendered.should match_selector("a", :href => proposals_path()) do |link|
        link.should have_content("All proposals")
      end
    end

    it "contains proposal subject" do
      rendered.should match_selector('.subject') do |subject|
        subject.should contain('For lunch')
      end
    end

    it "contains proposal wording" do
      rendered.should match_selector('.wording') do |wording|
        wording.should contain("Let's have a sandwich")
      end
    end
    
    it "contains proposal protocol" do
      rendered.should match_selector('.protocol') do |protocol|
        protocol.should contain('Unanimity')
      end
    end
    
    it "contains the choices" do
      rendered.should match_selector('.choices') do |choices|
        choices.should contain('a choice for fun')
      end
    end

    describe "#new_choice form" do
      it "POSTs to create a new choice" do
        rendered.should have_selector("form#new_choice", :action => proposal_choices_path(@proposal), :method => 'post')
        rendered.should match_selector("form#new_choice", :action => proposal_choices_path(@proposal), :method => 'post') do |form|
          form.should have_selector("input", :type => 'submit', :value => 'Add this choice')
        end
      end
      
      it "label is an input text" do
        rendered.should have_selector("#new_choice input#choice_label", :type => 'text', :name => 'choice[label]')
      end
    end
    
  end

  describe "when not shared" do
    before do
      assign(:proposal, @proposal = stub_model(Proposal, :shared? => false))
      render
    end

    it "offers to to create a new guest pass for the proposal" do
      rendered.should have_selector("form#new_guest_pass", :action => proposal_guest_passes_path(@proposal)) do |form|
        form.should have_selector("input", :type => 'submit')
      end
    end
  end

  describe "when already shared" do
    before do
      assign(:proposal, @proposal = stub_model(Proposal,
          :shared? => true,
          :guest_pass_token => 'super-secret-token'))
      render
    end

    it "displays the guest pass" do
      rendered.should_not have_selector("form#new_guest_pass")
      rendered.should match_selector('.guest_pass') do |guest_pass|
        guest_pass.should contain('super-secret-token')
      end
    end
  end
end