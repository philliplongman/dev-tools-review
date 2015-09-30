require "rails_helper"

feature 'user uses the search bar to look for a tool - ', %(
  As a developer
  I want to search for reviews on a specific tool
  So that I can see what others think of it
) do

  # Acceptance Criteria
  # [] I can search for a tool from the search bar
  # [] If any tools match my search, I am shown an index of results
  # [] If no tools match my search, I am shown a results page that says so
  # [] The letter-case of my searches should not affect my results

  before(:each) do
    ruby = FactoryGirl.create(:tool, name: "Ruby")
    javascript = FactoryGirl.create(:tool, name: "Javascript")
    foundation = FactoryGirl.create(:tool, name: "Foundation")
    sass = FactoryGirl.create(:tool, name: "Sass")
    atom = FactoryGirl.create(:tool, name: "Atom")
  end

  scenario 'User searches for a tool that exists' do
    visit root_path
    fill_in :search, with: 'ruby'
    click_button 'Search'
    expect(page).to have_content('Search Results')
    expect(page).to have_content('Ruby')
  end

  scenario "User searches for a tool that does not exist" do
    visit root_path
    fill_in :search, with: 'stuff'
    click_button 'Search'
    expect(page).to have_content('Search Results')
    expect(page).to have_content('No results found.')
  end
end
