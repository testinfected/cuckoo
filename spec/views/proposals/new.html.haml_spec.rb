require "rspec"

describe "proposals/new.html.haml" do

  before(:each) do
    assign(:proposal, Proposal.make)
    assign(:protocols, ["one", "two"])
    render
  end

  it "offers inputs for the subject" do
    rendered.should match_selector("form", :action => proposals_path(@proposal), :method => 'post') do |form|
      form.should have_selector("#subject")
    end
  end

  it "offers inputs for the wording" do
    rendered.should match_selector("form", :action => proposals_path(@proposal), :method => 'post') do |form|
      form.should have_selector("#wording")
    end
  end

  it "offers to select the protocol of the proposal" do
    rendered.should match_selector("form", :action => proposals_path(@proposal), :method => 'post') do |form|
      form.should have_selector("#protocol_class select")
      form.should match_selector("#protocol_class select") do |options|
        options.should have_selector("option", :count => 3)
        options.should have_selector("option", :value=>'')
        options.should have_selector("option", :value=>'one')
        options.should have_selector("option", :value=>'two')
      end
    end
  end
end