require 'rails_helper'

RSpec.feature "As a user with an account", type: :feature do
    scenario "user can log in" do
      user = create(:user)
      visit login_path

      within('.navbar-user-types') do
        click_on 'Sign In'
      end
      
      expect(current_path).to eq(login_path)
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button 'Sign In'
      expect(current_path).to eq(user_dashboard_index_path(user))
      expect(page).not_to have_content("Sign Up")
      expect(page).to have_content("Sign Out")
      expect(page).to have_content("Messages")
      expect(page).to have_content("Trips")
    end
  end
