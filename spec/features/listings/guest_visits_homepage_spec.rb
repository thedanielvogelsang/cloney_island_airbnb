require 'rails_helper'

RSpec.describe 'As a guest user' do
  it 'can create visit homepage and view listings' do
    visit '/'

    expect(current_path).to eq("/")

    expect(page).to have_content("Homes")

    within(".create-account-box") do
      click_on "Sign Up"
    end

    expect(current_path).to eq(users_dashboard_index_path)

  end
end
