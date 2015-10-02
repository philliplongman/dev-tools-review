require 'rails_helper'

feature 'authenticated user updates a review they created - ', %(
  As an authenticated user
  I want to update the reviews I add to the site
  So that I can change my mind
) do

  # Acceptance Criteria
  # [] If I added a review, I can click a link above it to edit the info
  # [] I must be logged in
  # [] I am taken to a form to edit the information
  # [] After I submit my changes, I am returned to the tool page for the
  #     review, and I see a message informing me the review has been updated.

  let(:review) { FactoryGirl.create(:review) }

  scenario "User edits a review they submitted" do
    sign_in_specific(review.user)
    visit tool_path(review.tool)
    click_link "Edit Review"
    fill_in('My review', with: 'a new description')
    click_button 'Submit'
    expect(page).to have_content('a new description')
    expect(page).to have_content('Review updated')
  end

  scenario "User cannot edit a tool they did not submit" do
    sign_in
    visit tool_path(review.tool)
    expect(page).to_not have_content('Edit Tool')
  end
end
