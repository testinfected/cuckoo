require 'spec_helper'

describe ChoicesController do

  before(:each) do
    @proposal = mock_model(Proposal)
    Proposal.should_receive(:find).with(@proposal.id).and_return(@proposal)
  end
  
  describe "POST create" do
    before(:each) do
      @choice_params = { "label" => "my label" }
      @choice = mock_model(Choice).as_null_object
      @proposal.stub_chain(:choices, :build).with(@choice_params).and_return(@choice)
    end

    it "creates a new choice and redirects to the proposal" do
      @choice.should_receive(:save!)
      post :create, :proposal_id => @proposal.id, :choice => @choice_params
      response.should redirect_to(@proposal)
    end
  end
  
  
  
  
end
