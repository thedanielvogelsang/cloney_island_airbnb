require 'rails_helper'

RSpec.feature "Admin can change property status", type: :feature do
  scenario "change status from pending to active" do
    skip
    role = create(:role, name: 'admin')
    admin = create(:user)
    admin.roles << role
    user = create(:user)
    # binding.pry
    #listing does not create right now
    listing = create(:listing, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path(admin)
    click_on "View All Properties"

    expect(current_path).to eq(admin_properties_path)

    within(".pending_properties") do
      expect(page).to have_content(listing.name)
      click_on "Activate"
    end

    expect(listing.status).to eq(1)
  end
end