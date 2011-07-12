require 'spec_helper'

describe VotesController do

  before(:each) do
    @proposal = mock_model(Proposal)
    @votes = double()
    @vote = double()
  end

  specify "a new vote is created from proposal build helper" do
    Proposal.should_receive(:find).and_return(@proposal)
    @proposal.should_receive(:votes).and_return(@votes)
    @votes.should_receive(:build).and_return(@vote)
    get :new, :proposal_id => :any
  end

  specify "the new vote and the proposal are both passed to the view" do
    Proposal.should_receive(:find).and_return(@proposal)
    @proposal.should_receive(:votes).and_return(@votes)
    @votes.should_receive(:build).and_return(@vote)
    get :new, :proposal_id => :any
    assigns(:vote).should == @vote
    assigns(:proposal).should == @proposal
  end

  specify "new vote creation should redirect to proposal list" do
    post :create, :proposal_id => :any
    response.should redirect_to proposals_path
  end

  specify "new vote should be saved" do
    vote_number = Vote.count
    post :create, :proposal_id => :any
    Vote.count.should == vote_number + 1
  end


end
