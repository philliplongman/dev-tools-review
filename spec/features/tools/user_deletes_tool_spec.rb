require 'rails_helper'

feature "User deletes its own tool" do
  let(:tool) { FactoryGirl.create(:tool) }

  scenario "User is able to delete its own tool" do
    sign_in_specific(tool.user)
    visit tool_path(tool)
    click_link "Delete Tool"
    # expect { Review.find(@review.id) }.
    #   to raise_error { "Couldn't find Tool with 'id'=#{@tool.id}" }
    expect(page).to have_content("Tool deleted")
    expect(page).to_not have_content("Delete Tool")
  end

  scenario "User is unable to delete another persons tool" do
    sign_in
    visit tool_path(tool)
    expect(page).to_not have_content("Delete Tool")
  end
end
