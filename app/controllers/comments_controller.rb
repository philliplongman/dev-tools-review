class CommentsController < ApplicationController
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

  def comment_params
    params.require(:comment).permit(:body)
  end
end
