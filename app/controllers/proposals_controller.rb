class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    Proposal.create!(params[:proposal])
    redirect_to proposals_path
  end
end
