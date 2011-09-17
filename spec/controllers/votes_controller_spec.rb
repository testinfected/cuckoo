require 'spec_helper'

describe VotesController do

  before(:each) do
    @proposal = mock_model(Proposal)
    Proposal.should_receive(:find).with(@proposal.to_param).and_return(@proposal)
  end

  describe "GET new" do
    it "assigns the proposal and a new vote" do
      get :new, :proposal_id => @proposal.to_param
      assigns(:proposal).should == @proposal
      assigns(:vote).should be_a_new(Vote)
    end
  end

  describe "POST create" do
    before(:each) do
      @vote_params = { "value" => "yes" }
      @vote = mock_model(Vote).as_null_object
      @proposal.stub_chain(:votes, :build).with(@vote_params).and_return(@vote)
    end

    it "creates a new vote and redirects to proposal list" do
      @vote.should_receive(:save!)
      post :create, :proposal_id => @proposal, :vote => @vote_params
      response.should redirect_to(proposals_path)
    end
  end
end
