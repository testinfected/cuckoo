require 'spec_helper'

describe "votes/new.html.haml" do

  before(:each) do
    assign(:proposal, @proposal = Proposal.make(:id => 1234))
    assign(:vote, @vote = @proposal.votes.build)
    @proposal.stub_chain(:protocol, :choices).and_return(["first", "second"])
    render
  end

  it "displays the proposal" do
    rendered.should have_content(@proposal.subject)
    rendered.should have_content(@proposal.wording)
  end

  it "exposes proposal's protocol choices to vote" do
    rendered.should have_selector("form", :action => proposal_votes_path(@proposal), :method => 'post') do |form|
      form.should have_selector("input[type=submit][value=first]#first")
      form.should have_selector("input[type=submit][value=second]#second")
    end
  end

  describe "votes breakdown" do

    before(:each) do
      assign(:proposal, @proposal = Proposal.make(:id => 1234))
      assign(:vote, @vote = @proposal.votes.build)
      @proposal.stub_chain(:protocol, :choices).and_return(["first", "second"])
    end

    specify "displays zero when there is no vote" do
      render
      rendered.should have_selector(".results")
      rendered.should match_selector(".results") do |results|
        results.should contain("0 first")
        results.should contain("0 second")
      end
    end

    it "displays the current number of votes" do
      breakdown = {}
      breakdown["first"] = 1
      breakdown["second"] = 0
      @proposal.should_receive(:breakdown).and_return(breakdown)
      render
      rendered.should match_selector(".results") do |results|
        results.should contain("1 first")
        results.should contain("0 second")
      end
    end

  end

end