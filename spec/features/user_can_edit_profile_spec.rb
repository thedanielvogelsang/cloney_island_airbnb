require 'rails_helper'

RSpec.feature "User can edit profile", type: :feature do
  scenario "user makes changes successfully" do
    user = create(:user, first_name: "Ben", phone_number: "ben_ross.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_dashboard_index_path(user)

    click_on "Edit Profile"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "First name", with: "New name"
    fill_in "Email", with: "new_email.com"

    click_on "Save"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("New name")

    click_on "View Profile"

    expect(page).to have_content("New name")
    expect(page).to have_content("new_email")
    expect(page).to_not have_content("Ben")
    expect(page).to_not have_content("ben_ross.com")
  end
end
