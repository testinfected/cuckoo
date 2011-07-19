require 'spec_helper'

describe ProposalsController do

  describe "GET index" do
    before(:each) do
      @proposals = []
      5.times { @proposals << Proposal.make }
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
      @proposal = Proposal.make(:id => 1234)
    end

    it "retrieves and assigns a proposal" do
      Proposal.should_receive(:find).with(@proposal.id).and_return(@proposal)
      get :show, :id => @proposal.id
      assigns(:proposal).should == @proposal
    end
  end

  describe "POST create" do
    before(:each) do
      @proposal_hash = { 'subject' => 'a subject', 'wording' => 'a proposition', 'protocol' => 'a protocol' }
      @proposal = mock_model(Proposal).as_new_record
      Proposal.should_receive(:new).with(@proposal_hash).and_return(@proposal)
    end

    it "creates proposal and redirects to index" do
      @proposal.should_receive(:save!)
      post :create, :proposal => @proposal_hash
      response.should redirect_to(:action => 'index')
    end
  end
end
