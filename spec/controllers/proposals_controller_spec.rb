require 'spec_helper'

describe ProposalsController do

  before(:each) do
    @proposal = mock_model(Proposal)
    Proposal.should_receive(:find).and_return(@proposal)
  end

  it "assigns proposal when showing a proposal" do
    get :show, :id => :any
    assigns(:proposal).should == @proposal
  end

end
