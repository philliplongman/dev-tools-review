class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :authorize_user, only: [:destroy]

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to tools_path
  end

  def create
    # @review = Review.new(review_params)
    @tool = Tool.find(params[:tool_id])
    @review = Review.new(review_params)
    @review.tool = @tool
    @review.user = current_user

    if @review.save
      flash[:notice] = "Success"
      redirect_to tool_path(@tool)
    else
      flash[:error] = "Please specify rating"
      redirect_to tool_path(@tool)
    end
  end

  private

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def review_params
    params.require(:review).permit(:rating, :body, :tool_id)
  end
end
