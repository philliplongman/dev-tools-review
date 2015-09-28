require "rails_helper"

feature 'An admin views a list of users - ', %(
  As an admin
  I want to view a list of users
  so that I can administer the site properly
) do

  scenario 'Admin is able to visit list of users' do
    member = FactoryGirl.create(:user)
    sign_in_admin
    visit users_path
    expect(page).to have_content(member.email)
  end

  scenario 'Member cannot access list of users' do
    member = FactoryGirl.create(:user)
    sign_in
    # visit users_path
    expect{ visit users_path }.to raise_error(ActionController::RoutingError)
    # expect{ visit users_path }.to eq("hiii")
  end

end
