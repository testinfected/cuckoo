require 'spec_helper'

describe "proposals/index.html.haml" do

  it "should display the subject of a proposal" do
    proposal = Proposal.make
    assign(:proposals, [proposal])
    render
    rendered.should have_selector("td.subject") do |td|
      td.should contain( proposal.subject )
    end
  end

end
