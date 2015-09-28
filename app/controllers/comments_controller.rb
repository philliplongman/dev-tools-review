class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :authorize_user, only: [:destroy]

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to tools_path
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

  private
  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
