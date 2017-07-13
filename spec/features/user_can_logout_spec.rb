require 'rails_helper'

RSpec.feature "Logged in user can log out", type: :feature do
  scenario "user sees the visitor options page" do
    skip
    user = create(:user)
    role = create(:role)
    user.roles << role
    
    visit root_path

    click_on "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"

    #expect(page).to have_content("#{user.username}")
    click_on "Sign out"

    expect(page).to have_link "Sign in", href: login_path
    expect(page).to_not have_content("Sign out")
  end
end
