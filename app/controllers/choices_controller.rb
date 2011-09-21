class ChoicesController < ApplicationController
  before_filter :find_proposal

  def create
    @choice = @proposal.choices.build(params[:choice])
    @choice.save!
    redirect_to(@proposal)
  end
  
  private
  def find_proposal
    @proposal = Proposal.find(params[:proposal_id].to_i)
  end

end
