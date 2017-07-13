require 'rails_helper'

RSpec.describe "As a user with an account" do
    scenario "user can log in" do
      skip
      user = create(:user)

      visit login_path
      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button 'Log In'
      expect(current_path).to eq(dashboard_path(user))
    end
  end
