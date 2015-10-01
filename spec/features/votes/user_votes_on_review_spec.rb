require 'rails_helper'

feature "Authenticated user votes on a review - ", %(
  As an authenticated user
  I want to vote reviews up or down
  So I can influence the conversation about development tools.
) do
  # Acceptance Criteria
  # [] I can click an upvote link next to a review to vote that review up
  # [] I can click a downvote link next to a review to vote that review down
  # [] I can remove my vote by clicking again on the link
  # [] I can change my up vote by clicking on the down link (and vice versa)
  # [] I can only vote once for each review
  # [] If I'm not signed in, I am taken to the login page

  let(:review) { FactoryGirl.create(:review) }

  scenario 'authenticated user upvotes a review', js: true do
    sign_in
    visit tool_path(review.tool)
    click_link "upvote-#{review.id}"
    within "#vote-count-#{review.id}" do
      expect(page).to have_content("1")
    end
  end

  scenario 'authenticated user downvotes a review', js: true do
    sign_in
    visit tool_path(review.tool)
    click_link "downvote-#{review.id}"
    within "#vote-count-#{review.id}" do
      expect(page).to have_content("-1")
    end
  end

  scenario 'authenticated user undoes a vote' do
    sign_in
    visit tool_path(review.tool)
    click_link "downvote-#{review.id}"
    click_link "downvote-#{review.id}"

    within "#vote-count-#{review.id}" do
      expect(page).to have_content("0")
    end
  end

  scenario 'unauthenticated user tries to vote' do
    visit tool_path(review.tool)
    expect(page).to_not have_content("Score: 0")
  end
end
