class VotesController < ApplicationController
  before_action :authenticate_user!
  def create
    vote = Vote.find_by(
      user_id: vote_params[:userId],
      review_id: vote_params[:reviewId]
    )

    if vote.nil?

      vote = Vote.new(vote_params)
      vote.save!
    else
      if vote.state == vote_params[:state]
        vote.state = nil
        vote.save!
      else
        vote.state = vote_params[:state]
        vote.save!
      end

    end
    render json: { voteCount: vote.review.vote_count }
  end

  private
  def vote_params
    params.require(:vote).permit(:state, :user_id, :review_id)
  end
end
