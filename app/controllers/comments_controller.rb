class CommentsController < AplicationController
  def create
    binding.pry
    @reviews = Review.find(params[:review_id])
    @comment = Comment.new

    # @reviews = Review.all
    # @review = @reviews.find(params[:review_id])
    # @comments = Comment.all
    # @comment = @review.comment
  end
end
