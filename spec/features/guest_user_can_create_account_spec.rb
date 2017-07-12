require 'rails_helper'

RSpec.describe 'As a guest user' do

  it 'can create an account' do
    visit '/'

    within('.navbar-user-types') do
      click_on "Sign Up"
    end

    expect(current_path).to eq(new_user_path)
    fill_in "Email", with: "d@d.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_on "Sign Up"

    expect(current_path).to eq(user_dashboard_path)
    expect(page).not_to have_content("Sign Up")
    expect(page).to have_content("Messages")
    expect(page).to have_content("Trips")
  end

end
