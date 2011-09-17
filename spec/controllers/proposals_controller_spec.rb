require 'spec_helper'

describe ProposalsController do

  describe "GET index" do
    before(:each) do
      @proposals = [] and 5.times { @proposals << mock_model(Proposal) }
    end

    it "retrieves and assigns all proposals" do
      Proposal.should_receive(:all).and_return(@proposals)
      get :index
      assigns(:proposals).should == @proposals
    end
  end

  describe "GET new" do
    it "assigns a new proposal" do
      get :new
      assigns(:proposal).should be_a_new(Proposal)
      assigns(:protocols).should == [ Unanimity.new.to_s, Majority.new.to_s ]
    end
  end

  describe "GET show" do
    before(:each) do
      @proposal = mock_model(Proposal)
    end

    it "retrieves and assigns a proposal" do
      Proposal.should_receive(:find).with(@proposal.to_param).and_return(@proposal)
      get :show, :id => @proposal
      assigns(:proposal).should == @proposal
    end
  end

  describe "POST create" do
    before(:each) do
      @proposal_params = { 'subject' => 'a subject', 'wording' => 'a proposition', 'protocol' => 'a protocol', 'private' => '1' }
      @proposal = mock_model(Proposal).as_new_record
      Proposal.should_receive(:new).with(@proposal_params).and_return(@proposal)
    end

    it "creates proposal and redirects to index" do
      @proposal.should_receive(:save!)
      post :create, :proposal => @proposal_params
      response.should redirect_to(proposals_path)
    end
  end
end
