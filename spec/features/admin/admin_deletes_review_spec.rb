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
    click_button("Delete review #{review.id}")
    expect{ Review.find(review.id) }.to raise_error { "Couldn't find"\
      " Tool with 'id'=#{review.id}" }
  end

  scenario 'Members should not be able to delete reviews' do
    review = FactoryGirl.create(:review)
    sign_in
    visit tool_path(review.tool)
    expect(page).to_not have_content("Delete review #{review.id}")
  end
end
