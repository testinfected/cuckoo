require 'spec_helper'

describe GuestPassesController do
  before(:each) do
    @proposal = mock_model(Proposal)
  end

  describe "POST create" do
    before(:each) do
      Proposal.should_receive(:find).with(@proposal.to_param).and_return(@proposal)
      @guest_pass = mock_model(GuestPass).as_null_object
      @proposal.should_receive(:build_guest_pass).and_return(@guest_pass)
    end

    it "creates a new guest pass and redirects to the proposal" do
      @guest_pass.should_receive(:save!)
      post :create, :proposal_id => @proposal
      response.should redirect_to(@proposal)
    end
  end

  describe "GET use" do
    before(:each) do
      guest_pass = mock_model(GuestPass, :proposal => @proposal)
      GuestPass.should_receive(:find_by_token).with('secret_token').and_return(guest_pass)
    end

    it "displays the voting page on the proposal" do
      get :use, :token => 'secret_token'
      response.should render_template("votes/new")
      assigns(:proposal).should == @proposal
      assigns(:vote).should be_a_new(Vote)
    end
  end
end
