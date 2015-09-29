require 'rails_helper'

feature "User deletes its own comment" do
  background do
    @comment = FactoryGirl.create(:comment)
  end

  scenario "User is able to delete its own comment", js: true do
    sign_in_specific(@comment.user)
    visit tool_path(@comment.review.tool)
    click_link "1 comment(s)"
    click_button "Delete comment #{@comment.id}"
    expect { Comment.find(@comment.id) }.
      to raise_error { "Couldn't find Comment with 'id'=#{@comment.id}" }
    expect(page).to have_content("Comment deleted")
  end

  scenario "User is unable to delete another persons comment", js: true do
    sign_in
    visit tool_path(@comment.review.tool)
    click_link "1 comment(s)"
    expect(page).to_not have_content("Delete comment #{@comment.id}")
  end
end
