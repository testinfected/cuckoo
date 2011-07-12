require 'spec_helper'

describe "proposals/show.html.haml" do

  before(:each) do
    @proposal = Proposal.make
    assign(:proposal, @proposal)
    render
  end

  it "should display the subject" do
    rendered.should contain(@proposal.subject)
  end

  it "should display the wording" do
    rendered.should contain(@proposal.wording)
  end

end