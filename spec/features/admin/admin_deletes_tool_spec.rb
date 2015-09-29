require "rails_helper"

feature 'Admin deletes tool - ', %(
  As an admin
  I want to delete a tool
  So that I can cull the tool population
) do

  scenario 'Admin should be able to delete tools' do
    tool = FactoryGirl.create(:tool)
    sign_in_admin
    visit tools_path
    click_button("Delete #{tool.name}")
    expect(page).to_not have_content(tool.name)
  end

  scenario 'Members should not be able to delete tools' do
    tool = FactoryGirl.create(:tool)
    sign_in
    visit tools_path
    expect(page).to_not have_content("Delete #{tool.name}")
  end
end
