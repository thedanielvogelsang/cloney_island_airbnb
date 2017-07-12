require 'rails_helper'

RSpec.describe "Admin can change property status" do
  feature "as an admin I can change property status from pending to active" do
    admin = create(:user, role: 3)
    property = create(:property, status: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path(admin)
    click_on "View All Properties"

    expect(current_path).to eq(admin_properties_path)

    within(".pending_properties") do
      expect(page).to have_content(property.name)
      click_on "Activate"
    end

    expect(property.status).to eq(1)
  end
end
