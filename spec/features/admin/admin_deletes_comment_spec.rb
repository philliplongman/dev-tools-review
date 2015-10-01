require "rails_helper"

feature 'Admin deletes comment - ', %(
  As an admin
  I want to delete a comment
  So that I can cull the comment population
) do

  scenario 'Admin should be able to delete comments', js: true do
    sign_in_admin
    comment = FactoryGirl.create(:comment)
    visit tool_path(comment.review.tool)
    click_link "1 comment(s)"
    click_link("Delete Comment")
    sleep(1)
    expect(page).to have_content("0 comment(s)")
  end

  scenario 'Members should not be able to delete comments', js: true do
    comment = FactoryGirl.create(:comment)
    sign_in
    visit tool_path(comment.review.tool)
    click_link "1 comment(s)"
    expect(page).to_not have_content("Delete Comment")
  end
end
