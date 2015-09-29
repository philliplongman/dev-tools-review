class VotesController < ApplicationController
  def create
    @votes = Vote.new(vote_params)
  end
  
  private

  def vote_params
    params.require(:vote).permit(:state, :user_id, :review_id)
  end
end
