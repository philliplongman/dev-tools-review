require 'rails_helper'

feature 'authenticated user updates a comment they created - ', %(
  As an authenticated user
  I want to update the comments I add to reviews
  So that I take back those mean things I said
) do

  # Acceptance Criteria
  # [] If I added a comment, I can click a link above it to edit it
  # [] I must be logged in
  # [] I am taken to a form to edit the text
  # [] After I submit my changes, I am returned to the tool page for the
  #     comment, and I see a message informing me the comment has been updated.

  before(:each) do
    @comment = FactoryGirl.create(:comment)
  end

  scenario "User edits a comment they submitted", js: true do
    sign_in_specific(@comment.user)
    visit tool_path(@comment.review.tool)
    click_link "1 comment(s)"
    click_link "Edit Comment"
    fill_in 'Comment', with: 'a different comment'
    click_button 'Submit'
    click_link "1 comment(s)"
    expect(page).to have_content('a different comment')
    expect(page).to have_content('Comment updated')
  end

  scenario "User cannot edit a tool they did not submit" do
    sign_in
    visit tool_path(@comment.review.tool)
    expect(page).to_not have_content('Edit Comment')
  end
end
