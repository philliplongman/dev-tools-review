require 'rails_helper'

feature 'authenticated user adds new dev tool - ', %(
  As an authenticated user
  I want to add a new dev tool
  So I can share my dev tool with other users
) do

  # Acceptance Criteria
  # [x] I can click a link on the main page to add a new tool
  # [x] If I am not signed in, I am taken to the login page
  # [x] I must specify a name and description to submit the new tool form
  # [x] If I do not specify a name or description,
  #     I recieve an error message
  # [x] When I successfully submit a new tool,
  #     I receive a message informing me that it has been successfully submitted
  # [x] When I successfully submit a new tool,
  #     I am taken to that tool's page

  scenario 'authenticated user submits a tool' do
    user = FactoryGirl.create(:user)
    category = FactoryGirl.create(:category)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit root_path
    click_link "Add a dev tool!"

    fill_in 'tool[name]', with: "Ruby"
    select category.name, from: 'Category'
    fill_in 'tool[description]', with: "This language is very shiney."

    click_button 'Submit'

    expect(page).to have_content("Successfully created a new dev tool!")
    expect(page).to have_content("Ruby")
  end

  scenario 'unauthenticated user clicks the link to add a new tool' do
    visit root_path
    click_link 'Add a dev tool!'

    expect(page).to have_content(
      "You need to sign in or sign up before continuing."
    )
  end

  scenario 'user submits a blank form' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_tool_path
    click_button 'Submit'

    expect(page).to have_content(
      "Name can't be blank | Description can't be blank"
    )
  end
end
