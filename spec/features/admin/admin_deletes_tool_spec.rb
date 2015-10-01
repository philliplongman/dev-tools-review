require "rails_helper"

feature 'Admin deletes tool - ', %(
  As an admin
  I want to delete a tool
  So that I can cull the tool population
) do

  scenario 'Admin should be able to delete tools' do
    tool = FactoryGirl.create(:tool)
    sign_in_admin
    visit tool_path(tool)
    click_link("Delete Tool")
    expect(page).to_not have_content(tool.name)
  end

  scenario 'Members should not be able to delete tools' do
    tool = FactoryGirl.create(:tool)
    sign_in
    visit tool_path(tool)
    expect(page).to_not have_content("Delete Tool")
  end
end
