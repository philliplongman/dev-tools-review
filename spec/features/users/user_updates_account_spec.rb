require 'rails_helper'

feature 'user registers', %Q{
  As a visitor
  I want to update my account info
  So that I'm not trapped in the past'
} do

  # Acceptance Criteria:
  # [] I can click a link in the nav bar to see a page with my account info.
  # [] I can click a link in my account info to update the info.
  # [] I am taken to a form to update my email.
  # [] When I submit my changes, I am returned to my account page.

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario 'User visits account page' do
    sign_in_specific(@user)
    click_link "My Account"

    expect(page).to have_content(@user.email)
  end

  scenario 'User visits account page' do
    sign_in_specific(@user)
    click_link "My Account"
    first("tr").click_link("Update")
    fill_in "Email", with: "newemail@gmail.com"
    click_button "Submit"

    expect(page).to have_content("newemail@gmail.com")
  end
end
