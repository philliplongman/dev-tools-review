class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user, only: [:destroy]

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to tool_path(@comment.review.tool)
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.review_id = @review.id
    if @comment.save
      flash[:success] = "Thank you for your valid(?) opinion!"
      redirect_to tool_path(@review.tool_id)
    else
      @tool = @review.tool
      @reviews = @tool.reviews
      @category = @tool.category
      @review = Review.new
      flash[:warning] = "Form errors"
      render "tools/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @tool = @review.tool
  end

  def update
    @comment = Comment.update(params[:id], comment_params)
    @tool = @comment.review.tool
    if @comment.save
      flash[:info] = "Comment updated"
      redirect_to @tool
    else
      flash[:warning] = "Form errors"
      render :edit
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_user
    unless current_user == @comment.user || current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
