require 'rails_helper'

RSpec.describe "As a user with an account" do
    it "can log in" do
      user = create(:user)
      visit login_path
      click_on 'Log In'

      expect(current_path).to eq(login_path)
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button 'Sign in'
      expect(current_path).to eq(users_dashboard_index_path)
    end
  end
