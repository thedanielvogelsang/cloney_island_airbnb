require 'rails_helper'

RSpec.feature "Host can view their reservations", type: :feature do
  scenario "host visits host dashboard" do
    role = create(:role, name: 'host')
    role2 = create(:role, name: 'traveler')
    host = create(:user, first_name: 'Host Name')
    host.roles << role
    other_host = create(:user, first_name: 'Other Host')
    other_host.roles << role    

    listing = create(:listing, user_id: host.id)
    
    traveler = create(:user, first_name: 'Traveler name')
    traveler.roles << role2

    trip1 = create(:trip, host_id: host.id, listing_id: listing.id)
    trip2 = create(:trip, host_id: host.id, listing_id: listing.id)
    trip3 = create(:trip, host_id: other_host.id)

    #visit '/'

    #click_on 'Listings' #this involves logic in the partial that if they're a host they see Listings, if they're not they see 'Become a Host'

    #expect(current_path).to eq '/host_dashboard_index'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(host)

    # visit host_dashboard_path(host) <-- i think i want it to be an index
    visit host_dashboard_index_path(host)

    expect(page).to have_content 'All Reservations'
    expect(page).to have_content 'Status'
    expect(page).to have_content 'Dates and Locations'
    expect(page).to have_content 'Guest'
    expect(page).to have_content 'Details'

    expect(page).to have_selector(".trip", count: 2)

    expect(page).to have_content listing.address.street_address
    expect(page).to have_content listing.name
    expect(page).to have_content listing.address.city
    expect(page).to have_content listing.address.state
    expect(page).to have_content listing.address.zip_code
    expect(page).to have_content trip1.trip_status
    expect(page).to have_content trip1.start_date
    expect(page).to have_content trip1.end_date
    expect(page).to have_content trip1.user.first_name
    expect(page).to have_content trip2.trip_status
    expect(page).to have_content trip2.start_date
    expect(page).to have_content trip2.end_date
    expect(page).to have_content trip2.user.first_name

    expect(page).to have_content 'Message History'
  end

  xscenario "host clicks to view reservation" do
  end
  xscenario "clicks link to view own listings" do
  end
  xscenario "clicks link to create listing" do
  end
end

# As an authenticated Host
# When I click on listings
# And I click on “Your Reservations”
# Then I should be on “/host/listings/reservations”
# And I should see add new reservation button
# And I should see my reservations image(s)
# And the image should link to the listing's show page
# And I should see the property title with a link
# And I should see the property location, updated_at
# And I should see an "unlisted" button and preview "button"
# And I should see my listed properties description(s)
# And I should see my listed properties location(s)
# And I should see dropdown for unlisted/listed option
# And I should see button for link to “listings/preview”