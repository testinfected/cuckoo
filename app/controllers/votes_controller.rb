class VotesController < ApplicationController

  def new
    @proposal = Proposal.find(params[:proposal_id])
    @vote = @proposal.votes.build
  end

  def create
    vote = Vote.create!(params[:vote])
    vote.proposal_id= params[:proposal_id]
    vote.save
    redirect_to proposals_path
  end

end
