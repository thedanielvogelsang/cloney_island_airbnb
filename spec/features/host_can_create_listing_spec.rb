require 'rails_helper'

RSpec.feature "Host can do the following with listings", type: :feature do
  scenario "create a new listing" do
    host_role = create(:role, name: 'host')
    traveler_role = create(:role)
    host = create(:user)
    host.roles << [host_role, traveler_role]

    visit new_user_hosts_listing_path(host)
    # binding.pry

    "end"
  end
end
