require 'spec_helper'

describe VotesController do

  before(:each) do
    @proposal = mock_model(Proposal, :id => 1234)
    Proposal.should_receive(:find).with(@proposal.id).and_return(@proposal)
  end

  describe "GET new" do
    it "assigns the proposal and a new vote" do
      get :new, :proposal_id => @proposal.id
      assigns(:proposal).should == @proposal
      assigns(:vote).should be_a_new(Vote)
    end
  end

  describe "POST create" do
    before(:each) do
      @vote = mock_model(Vote).as_null_object
      @proposal.stub_chain(:votes, :build).and_return(@vote)
    end

    it "creates a new vote and redirects to proposal list" do
      @vote.should_receive(:save!).and_return(true)
      post :create, :proposal_id => @proposal.id
      response.should redirect_to(:controller => 'proposals', :action => 'index')
    end
  end
end
