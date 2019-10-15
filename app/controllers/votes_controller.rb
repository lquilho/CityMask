class VotesController < ApplicationController
  before_action :get_fixpoint

  def create
    @vote = Vote.create(fixpoint: @fixpoint, user: current_user)
    authorize @vote
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    authorize @vote
  end

  private

  def get_fixpoint
    @fixpoint = Fixpoint.find(params[:fixpoint_id])
  end
end
