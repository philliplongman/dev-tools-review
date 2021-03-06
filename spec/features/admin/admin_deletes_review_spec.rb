require "rails_helper"

feature 'Admin deletes review - ', %(
  As an admin
  I want to delete a review
  So that I can cull the review population
) do

  scenario 'Admin should be able to delete reviews' do
    sign_in_admin
    review = FactoryGirl.create(:review)
    visit tool_path(review.tool)
    click_link("Delete Review")
    expect(page).to_not have_content("Delete Review")
  end

  scenario 'Members should not be able to delete reviews' do
    review = FactoryGirl.create(:review)
    sign_in
    visit tool_path(review.tool)
    expect(page).to_not have_content("Delete Review")
  end
end
