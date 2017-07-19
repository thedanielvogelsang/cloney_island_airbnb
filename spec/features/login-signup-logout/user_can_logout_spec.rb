require 'rails_helper'

RSpec.feature "Logged in user can log out", type: :feature do
  scenario "user sees the visitor options page" do
    skip
    user = create(:user)
    role = create(:role)

    user.roles << role

    visit root_path

    within('.navbar-user-types') do
      click_on "Sign In"
    end

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    within('.user_forms') do
      click_on "Sign In"
    end

    click_on "Sign Out"

    expect(page).to have_link "Sign In", href: login_path
    expect(page).to_not have_content("Sign Out")
  end
end
