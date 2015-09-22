require 'rails_helper'

feature 'authenticated user adds new dev tool - ', %(
  As an authenticated user
  I want to add a new dev tool
  So I can share my dev tool with other users
) do

  # Acceptance Criteria
  # [] I can click a link on the main page to add a new tool
  # [] If I am not signed in, I am taken to the login page
  # [] I must specify a name and description to submit the new tool form
  # [] If I do not specify a name or description, I recieve an error message
  # [] When I successfully submit a new tool, I receive a message informing me that it has been successfully submitted
  # [] When I successfully submit a new tool, I am taken to that tool's page

  scenario 'authenticated user clicks the link to add a new tool' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit tools_path
    page.find_link('Add a dev tool!').click
    # click_link('Add a dev tool!')

    expect(page).to have_content('Add a new tool')
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
  end

  scenario 'unauthenticated user clicks the link to add a new tool' do
    click_link('Add a dev tool!')

    expect(page.current_path).to eq new_user_session
  end


  scenario 'user submits a tool' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    pending "Can't submit until show page is written"
    visit new_tool_path
    fill_in 'tool[name]', with: "Ruby"
    fill_in 'tool[description]', with: "This language is very shiney."
    click_button 'Submit'

    expect(page.current_path).to eq tool_path(@tool)
    expect(page).to have_content("Success!")
  end

  scenario 'user submits a blank form' do
    visit new_tool_path
    click_button 'Submit'

    expect(page).to have_content("Please fill out both fields.")
  end
end
