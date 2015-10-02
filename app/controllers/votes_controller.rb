class VotesController < ApplicationController
  before_action :authenticate_user!
  def create
    vote = Vote.find_or_create_by(
      user_id: vote_params[:userId],
      review_id: vote_params[:reviewId]
    )

    if vote.state == vote_params[:state]
      vote.state = nil
    else
      vote.state = vote_params[:state]
    end
    vote.save!

    render json: { voteCount: vote.review.vote_count }
  end

  private

  def vote_params
    params.require(:vote).permit(:state, :userId, :reviewId)
  end
end
