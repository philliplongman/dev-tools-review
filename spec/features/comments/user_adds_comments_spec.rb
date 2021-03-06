require 'rails_helper'

feature 'Authenticated user adds comment on review - ', %(
  As an authenticated user
  I want to comment on reviews
  So I can broadcast my opinions about opinions to the world
) do
#  Acceptance Criteria
# [x] If I submit a comment while not signed in, I am redirected to sign-in page
# [x] If I do not have a text body, I recieve an error message
# [x] When I successfully submit a comment, I receive a message informing me
#     that it has been successfully submitted
# [x] When I successfully submit a new comment, I see it added to the page
# [X] There is a link under each review, to add a comment

  let(:review) { FactoryGirl.create(:review) }

  scenario 'User sees link to add a comment under review', js: true do
    sign_in
    visit tool_path(review.tool)

    expect(page).to have_content('0 comment(s)')
    click_link '0 comment(s)'
    expect(page).to have_content('Add a comment')
  end

  scenario 'Unauthenticated user submits a comment', js: true do
    visit tool_path(review.tool)

    click_link '0 comment(s)'
    click_link 'Add a comment'

    fill_in('comment_body', with: 'I want to rate your rating!!!!!')
    click_button('Submit')

    expect(page).not_to have_content('Thank you for your valid(?) opinion!')
    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
  end

  scenario 'Authenticated user submits a comment', js: true do
    sign_in
    visit tool_path(review.tool)
    click_link '0 comment(s)'
    click_link 'Add a comment'
    fill_in('comment_body', with: 'I want to rate your rating!!!!!')
    click_button('Submit')

    expect(page).to have_content('1 comment(s)')
    click_link '1 comment(s)'

    expect(page).to have_content('Thank you for your valid(?) opinion!')
    expect(page).to have_content('I want to rate your rating!!!!!')
  end

  scenario 'Authenticated user submits a blank comment', js: true do
    sign_in
    visit tool_path(review.tool)
    click_link '0 comment(s)'
    click_link 'Add a comment'
    click_button('Submit')

    expect(page).to have_content("Form errors")
  end
end
