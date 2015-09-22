require 'rails_helper'

feature 'user should view index page - ', %(
  As a developer
  I want to see the reviews for a tool
  So that I can see if the public finds it useful.
  ) do

  # Acceptance Criteria:
  # [x] When I visit the show path of a tool, I should see its details.
  # [x] I should also see a list of reviews.

  scenario 'see details for a tool' do
    review = FactoryGirl.create(:review)
    visit "/tools/#{review.tool.id}"
    expect(page).to have_content(review.tool.name)
    expect(page).to have_content(review.tool.description)
  end

  scenario 'user should see a list of reviews for that tool' do
    review = FactoryGirl.create(:review)
    visit "/tools/#{review.tool.id}"
    save_and_open_page
    expect(page).to have_content(review.rating)
  end
end
