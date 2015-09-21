require "rails_helper"

feature "user creates a review" %Q{
  As an authenticated user
  I want to add a review to a tool's page
  So that I can share my knowledge with other users
} do

  scenario "user succesfully adds a review" do
    visit "/tools/:tool_id/reviews/new"

    fill_in "rating" with: 5
    fill_in "body" with: "Excellent tool!"

    click_button :Submit

    expect(page).to have_content("Excellent tool!")
  end

  scenario "user fails to add a review" do
    visit "/tools/:tool_id/reviews/new"

    fill_in "rating" with: 20
    fill_in "body" with: ""

    click_button :Submit

    expect(page).to have_content("Rating must be between 1 and 5")
  end
end
