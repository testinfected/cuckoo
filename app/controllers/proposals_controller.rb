class ProposalsController < ApplicationController
  respond_to :html

  def index
    respond_with(@proposals = Proposal.all)
  end

  def new
    respond_with(@proposal = Proposal.new)
  end

  def create
    proposal = Proposal.new(params[:proposal])
    proposal.save!
    redirect_to(proposals_path)
  end

  def show
    respond_with(@proposal = Proposal.find(params[:id]))
  end
end
