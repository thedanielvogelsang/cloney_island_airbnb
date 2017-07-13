require 'rails_helper'

RSpec.describe 'As a guest user' do

  it 'can create an account' do
    visit '/'

    within('.navbar-user-types') do
      click_on "Sign Up"
    end

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "d@d.com"
    fill_in "First name", with: "Puff"
    fill_in "Last name", with: "Magic Dragon"
    fill_in "Phone number", with: "555-555-5555"
    fill_in "Birthday", with: "2017-07-11"
    fill_in "Password", with: "password"

    within(".create-account-box") do
      click_on "Sign Up"
    end

    expect(current_path).to eq(users_dashboard_index_path)
    expect(page).not_to have_content("Sign Up")
    expect(page).to have_content("Sign out")
    expect(page).to have_content("Messages")
    expect(page).to have_content("Trips")
  end

end
