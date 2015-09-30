class VotesController < ApplicationController
  def create
    before_action :authenticate_user!

    vote = Vote.new(vote_params)

    if !vote.save
      vote = Vote.find_by(
        user_id: vote_params[:user_id],
        review_id: vote_params[:user_id]
      )
      if vote.state == vote_params[:state]
        vote.state = nil
        vote.save!
      else
        vote.state = vote_params[:state]
        vote.save!
      end
    end

    # render json
  end

  private

  def vote_params
    params.require(:vote).permit(:state, :user_id, :review_id)
  end
end
