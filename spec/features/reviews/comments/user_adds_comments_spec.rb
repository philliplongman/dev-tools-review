require 'rails_helper'

feature 'Authenticated user adds comment on review - ', %(
  As an authenticated user
  I want to comment on reviews
  So I can broadcast my opinions about opinions to the world
) do
#  Acceptance Criteria
# [] If I submit a comment while not signed in, I am redirected to sign-in page
# [] Comment must contain text body
# [] If I do not have a text body, I recieve an error message
# [] When I successfully submit a comment,
#    I receive a message informing me that it has been successfully submitted
# [] When I successfully submit a new comment, I see it added to the page
# [X] There is a link under each review, to add a comment
# [] Comment is added to page sans-reload

  scenario 'User sees link to add comment under review' do
    review = FactoryGirl.create(:review)
    visit tool_path(review.tool) ###
    expect(page).to have_content('Add comment')
  end

  # scenario 'User clicks link and drop-down new comment form appears' do
  #
  # end
  #
  # scenario 'Authenticated user submits a comment' do
  #   review = FactoryGirl.create(:review)
  #   sign_in
  #   visit tool_path(review.tool)
  #   click_link 'Add comment'
  #   fill_in('comment', with: 'I want to rate your rating!!!!!')
  #   click_button('Submit comment')
  #   expect(page).to have_content('Thank you for submitting your comment.')
  # end
end
