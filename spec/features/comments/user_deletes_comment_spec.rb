require 'rails_helper'

feature "User deletes its own comment" do
  background do
    @comment = FactoryGirl.create(:comment)
  end

  scenario "User is able to delete its own comment", js: true do
    sign_in_specific(@comment.user)
    visit tool_path(@comment.review.tool)
    click_link "1 comment(s)"
    click_link "Delete Comment"
    expect(page).to have_content("Comment deleted")
    expect(page).to_not have_content("Delete Comment")
  end

  scenario "User is unable to delete another persons comment", js: true do
    sign_in
    visit tool_path(@comment.review.tool)
    click_link "1 comment(s)"
    expect(page).to_not have_content("Delete Comment")
  end
end
