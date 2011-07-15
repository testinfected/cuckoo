class VotesController < ApplicationController
  before_filter :find_proposal

  respond_to :html

  def new
    respond_with(@vote = Vote.new)
  end

  #todo Make choice part of the vote params to remove the need to write the value
  def create
    vote = @proposal.votes.build(params[:vote])
    vote.value = params[:commit]
    vote.save!
    redirect_to(proposals_path)
  end

  private
  def find_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end
end
