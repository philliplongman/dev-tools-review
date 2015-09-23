require "rails_helper"

feature 'authenticated user adds new review to a dev tool - ', %(
  As an authenticated user
  I want to review a dev tool
  So I can tell other people what I think of it
) do

  # Acceptance Criteria
  # [] I can submit a form on the tool's page to add a new review
  # [] If I am not signed in when I submit, I am taken to the login page
  # [] I must specify a rating to submit
  # [] If I do not specify a rating, I recieve an error message
  # [] When I successfully submit a new review,
  #    I receive a message informing me that it has been successfully submitted
  # [] When I successfully submit a new review, I see it added to the page

  scenario 'authenticated user submits a review' do
    tool = FactoryGirl.create(:tool)

    sign_in
    visit tool_path(tool)
    select '★★★★★', from: 'My rating'
    fill_in 'My review', with: 'This is the greatest language ever!'
    click_button "Submit"

    expect(page).to have_content 'Success'
    expect(page).to have_content 'This is the greatest language ever!'
  end

  scenario 'authenticated user submits a blank form' do
    tool = FactoryGirl.create(:tool)

    sign_in
    visit tool_path(tool)
    click_button 'Submit'

    expect(page).to have_content("Please specify rating")
  end

  scenario 'unauthenticated user submits a review' do
    tool = FactoryGirl.create(:tool)

    visit tool_path(tool)
    select '★★★★★', from: 'My rating'
    fill_in 'My review', with: 'This is the greatest language ever!'
    click_button 'Submit'

    expect(page).to have_content(
      "You need to sign in or sign up before continuing"
    )
  end
end
