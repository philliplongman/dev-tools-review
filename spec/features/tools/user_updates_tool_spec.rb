require "rails_helper"

feature 'authenticated user updates a tool they created - ', %(
  As an authenticad user
  I want to update the tools I add to the site
  So that I can keep the info about it current
) do

  # Acceptance Criteria
  # [x] If I added a tool, I can click a link on it's page to edit the info
  # [x] I must be logged in
  # [x] I am taken to a form to edit the information
  # [x] After I submit my changes, I am returned to the tools page, and
  #     I recieve a message informing me the tool has been updated.

  before(:each) do
    @tool = FactoryGirl.create(:tool)
  end

  scenario "Author of tool submission edits the title and description" do
    sign_in_specific(@tool.user)
    visit tool_path(@tool)
    click_link "Edit Tool"
    fill_in('Name', with: 'Something new')
    fill_in('Description', with: 'a description')
    click_button 'Submit'
    expect(page).to have_content('Something new')
    expect(page).to have_content('a description')
    expect(page).to have_content('Tool updated')
  end

  scenario "User cannot edit a tool they did not submit" do
    sign_in
    visit tool_path(@tool)
    expect(page).to_not have_content('Edit Tool')
  end
end
