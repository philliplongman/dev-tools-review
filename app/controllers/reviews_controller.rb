class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_review, only: [:destroy]
  before_action :authorize_user, only: [:destroy]

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to tool_path(@review.tool)
  end

  def create
    @tool = Tool.find(params[:tool_id])
    @review = Review.new(review_params)
    @review.tool = @tool
    @review.user = current_user

    if @review.save
      flash[:success] = "Success"
      redirect_to tool_path(@tool)
    else
      @reviews = @tool.reviews
      @comment = Comment.new
      @category = @tool.category
      flash[:warning] = "Form errors"
      render "tools/show"
    end
  end

  def edit
    @review = Review.find(params[:id])
    @tool = @review.tool
  end

  def update
    @review = Review.update(params[:id], review_params)
    @tool = @review.tool
    if @review.save
      flash[:info] = "Review updated"
      redirect_to @tool
    else
      flash[:warning] = "Form errors"
      render :edit
    end
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def authorize_user
    unless current_user == @review.user || current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def review_params
    params.require(:review).permit(:rating, :body, :tool_id)
  end
end
