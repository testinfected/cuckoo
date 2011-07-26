require 'spec_helper'

describe VotesController do

  before(:each) do
    @proposal = Proposal.make(:id => 1234)
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
      @vote_params = { "value" => "yes" }
      @vote = mock_model(Vote).as_null_object
      @proposal.stub_chain(:votes, :build).with(@vote_params).and_return(@vote)
    end

    it "creates a new vote and redirects to proposal list" do
      @vote.should_receive(:save!)
      post :create, :proposal_id => @proposal.id, :vote => @vote_params
      response.should redirect_to(proposals_path)
    end
  end
end
