require "rails_helper"

feature 'Admin deletes user - ', %(
  As an admin
  I want to delete a user
  So that I can maintain a clean community
) do

  scenario 'Admin should be able to delete users' do
    member = FactoryGirl.create(:user)
    sign_in_admin
    visit users_path
    first("tr").click_link("Delete User")
    expect(page).to_not have_content(member.email)
    expect(page).to have_content("User deleted")
  end
end
