require 'rails_helper'

feature 'user views tools index page - ', %(
  As an authenticated user
  I want to see a list of all dev tools
  So that I can learn about new dev tools.
  ) do

  # Acceptance Criteria:
  # [x] When I visit the index path I should see a list of dev tool names.
  # [x] I should see the list of dev tools when I navigate to the root.

  scenario 'user visits index page' do
    tool = FactoryGirl.create(:tool)

    visit '/tools'
    expect(page).to have_content(tool.name)
  end

  scenario 'user visits root path' do
    tool = FactoryGirl.create(:tool)

    visit '/'
    expect(page).to have_content(tool.name)
  end
end
