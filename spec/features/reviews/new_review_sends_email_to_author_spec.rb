require 'rails_helper'

feature 'Email alert sent to tool author when new review posted - ', %(
  As an authenticated user
  I want my newly posted review to trigger an email alert to the tool poster
  So that further discussion about the tool can occur
) do

  # Acceptance Criteria:
  # [x] I must be signed in
  # [x] My valid review submission must cause an email to be sent to the
  #    tool author
  # [x] If I submit an invalid review, no email should be sent to the tool
  #    author
  scenario "New review on tool sends email to tool poster" do
    ActionMailer::Base.deliveries.clear
    tool = FactoryGirl.create(:tool)
    sign_in
    visit tool_path(tool)
    select '★★★★★', from: 'My rating'
    fill_in 'My review', with: 'This is the greatest language ever!'
    click_button "Submit"
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "Invalid review submission does not send email to tool poster" do
    ActionMailer::Base.deliveries.clear
    tool = FactoryGirl.create(:tool)
    sign_in
    visit tool_path(tool)
    fill_in 'My review', with: 'Totally radical!'
    click_button 'Submit'
    expect(ActionMailer::Base.deliveries.count).to eq(0)
  end
end
