require 'rails_helper'

feature "User deletes its own review" do
  let(:review) { FactoryGirl.create(:review) }

  scenario "User is able to delete its own review" do
    sign_in_specific(review.user)
    visit tool_path(review.tool)
    click_link "Delete Review"
    expect { Review.find(review.id) }.
      to raise_error { "Couldn't find Review with 'id'=#{review.id}" }
    expect(page).to have_content("Review deleted")
  end

  scenario "User is unable to delete another persons review" do
    sign_in
    visit tools_path
    expect(page).to_not have_content("Delete Review")
  end
end
