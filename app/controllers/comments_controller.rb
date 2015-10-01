class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user, only: [:destroy]

  def destroy
    @comment.destroy
    flash[:alert] = "Comment deleted"
    redirect_to tool_path(@comment.review.tool)
  end

  def create
    @reviews = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.review_id = @reviews.id
    if @comment.save
      flash[:notice] = "Thank you for your valid(?) opinion!"
      redirect_to tool_path(@reviews.tool_id)
    else
      flash[:errors] = @comment.errors.full_messages.join(" | ")
      redirect_to tool_path(@reviews.tool_id)
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
      flash[:notice] = "Comment updated"
      redirect_to @tool
    else
      flash[:errors] = @comment.errors.full_messages.join(" | ")
      @categories = Category.all
      render :new
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
