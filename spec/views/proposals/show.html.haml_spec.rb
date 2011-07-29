require 'spec_helper'

describe "proposals/show.html.haml" do

  describe "proposal details" do
    before do
      assign(:proposal, @proposal = stub_model(Proposal, :subject => 'For lunch', :wording => "Let's have a sandwich"))
      render
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