require 'rails_helper'

RSpec.feature "Host can view their reservations", type: :feature do
  scenario "host visits host dashboard" do
    role = create(:role, name: 'host')
    host = create(:user)
    host.roles << role

    listing = create(:listing)
    listing.user = host    
    
    visit host_dashboard_path(host)
  end
end