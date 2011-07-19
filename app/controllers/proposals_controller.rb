require 'unanimity'
require 'majority'

class ProposalsController < ApplicationController
  respond_to :html

  def index
    respond_with(@proposals = Proposal.all)
  end

  def new
    @proposal = Proposal.new
    @protocols = [ Unanimity.new.to_s, Majority.new.to_s ]
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
