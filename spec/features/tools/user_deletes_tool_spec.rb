require 'rails_helper'


feature "User deletes its own tool" do
  background do
    @tool = FactoryGirl.create(:tool)
  end

  scenario "User is able to delete its own tool" do
    sign_in_specific(@tool.user)
    visit tools_path
    click_button "Delete #{@tool.name}"
    expect { Review.find(@review.id) }.
      to raise_error { "Couldn't find Tool with 'id'=#{@tool.id}" }
    expect(page).to have_content("Tool deleted")
  end

  scenario "User is unable to delete another persons tool" do
    sign_in
    visit tools_path
    expect(page).to_not have_content("Delete #{@tool.name}")
  end
end
