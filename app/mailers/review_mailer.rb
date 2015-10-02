class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.tool.user.email,
      subject: "New Review for #{review.tool.name}"
      )
  end
end
