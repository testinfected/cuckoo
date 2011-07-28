class GuestPassesController < ApplicationController

  def create
    @proposal = Proposal.find(params[:proposal_id])
    guest_pass = @proposal.build_guest_pass
    guest_pass.save!
    redirect_to(@proposal)
  end

  def use
    guest_pass = GuestPass.find_by_token(params[:token])
    @proposal = guest_pass.proposal
    @vote = Vote.new
    render 'votes/new'
  end
end
