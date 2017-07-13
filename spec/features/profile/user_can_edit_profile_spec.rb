require 'rails_helper'

RSpec.feature "User can edit profile", type: :feature do
  scenario "user makes changes successfully" do
    skip
    user = create(:user, name: "Ben", phone_number: 3038379093)
    login(user)

    visit dashboard_path

    click on "Edit Profile"

    expect(current_path).to eq(edit_user_path(user))

    fill_in :email, with: "New name"
    fill_in :phone_number, with: 1234567899

    click_on "Submit"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("New name")

    click_on "View Profile"

    expect(page).to have_content("New name")
    expect(page).to have_content(1234567899)
    expect(page).to_not have_content("Ben")
    expect(page).to_not have_content(1234567899)
  end
end
