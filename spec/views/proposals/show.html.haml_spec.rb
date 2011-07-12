require 'spec_helper'

describe "proposals/show.html.haml" do

  before(:each) do
    assign(:proposal, @proposal = Proposal.make)
    render
  end

  it "displays proposal subject" do
    rendered.should contain(@proposal.subject)
  end

  it "displays proposal wording" do
    rendered.should contain(@proposal.wording)
  end
end