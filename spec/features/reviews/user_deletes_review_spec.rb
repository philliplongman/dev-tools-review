require 'rails_helper'

feature "User deletes its own review" do
  background do
    @review = FactoryGirl.create(:review)
  end

  scenario "User is able to delete its own review" do
    sign_in_specific(@review.user)
    visit tool_path(@review.tool)
    click_button "Delete review #{@review.id}"
    expect { Review.find(@review.id) }.
      to raise_error { "Couldn't find Review with 'id'=#{@review.id}" }
    expect(page).to have_content("Review deleted")
  end

  scenario "User is unable to delete another persons review" do
    sign_in
    visit tools_path
    expect(page).to_not have_content("Delete review #{@review.id}")
  end
end
