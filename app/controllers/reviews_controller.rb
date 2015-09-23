class ReviewsController < ApplicationController
  before_action :authenticate_user!
  # def new
  #   @tool = Tool.find(params[:tool_id])
  #   @review = @tool.reviews.build
  #   binding.pry
  # end

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
  def review_params
    params.require(:review).permit(:rating, :body, :tool_id)
  end
end
