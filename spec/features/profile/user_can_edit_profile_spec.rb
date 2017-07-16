require 'rails_helper'

RSpec.feature "User can edit profile", type: :feature do
  scenario "user makes changes successfully" do
    user = create(:user, first_name: "Ben", last_name: "Ross")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_dashboard_index_path(user)

    click_on "Edit Profile"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "First name", with: "New first name"
    fill_in "Last name", with: "New last name"

    click_on "Save"

    expect(current_path).to eq(user_dashboard_index_path(user))

    expect(page).to have_content("New first name")
    expect(page).to have_content("New last name")
    expect(page).to_not have_content("Ben")
    expect(page).to_not have_content("Ross")
  end
end
