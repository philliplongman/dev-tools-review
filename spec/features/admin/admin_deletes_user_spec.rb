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
    click_button("Delete #{member.email}")
    expect(page).to_not have_content(member.email)
    expect(page).to have_content("User deleted")
  end

  scenario 'Members should not be able to delete users' do
    sign_in
    expect { visit users_path }.to raise_error(ActionController::RoutingError)
  end
end
