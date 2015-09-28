require "rails_helper"

feature 'Admin deletes comment - ', %(
  As an admin
  I want to delete a comment
  So that I can cull the comment population
) do

  scenario 'Admin should be able to delete comments' do
    sign_in_admin
    comment = FactoryGirl.create(:comment)
    visit tool_path(comment.review.tool)
    click_button("Delete comment #{comment.id}")
    expect { Comment.find(comment.id) }
      .to raise_error { "Couldn't find Tool with 'id'=#{comment.id}" }
  end

  scenario 'Members should not be able to delete comments' do
    comment = FactoryGirl.create(:comment)
    sign_in
    visit tool_path(comment.review.tool)
    expect(page).to_not have_content("Delete comment #{comment.id}")
  end
end
