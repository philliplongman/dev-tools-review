require 'rails_helper'
require 'database_cleaner'
RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

feature 'user views tools index page - ', %Q(
  As an authenticated user
  I want to see a list of all dev tools
  So that I can learn about new dev tools.
  ) do

=begin
  Acceptance Criteria:

  [x] When I visit the index path I should see a list of dev tool names.
  [x] I should see the list of dev tools when I navigate to the root.
=end

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
