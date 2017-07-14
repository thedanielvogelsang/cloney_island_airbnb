require 'rails_helper'

RSpec.feature "Host can view their reservations", type: :feature do
  scenario "host visits host dashboard" do
    role = create(:role, name: 'host')
    role2 = create(:role, name: 'traveler')
    host = create(:user)
    host.roles << role

    listing = create(:listing)
    listing.user = host
    
    traveler = create(:user)
    traveler.roles << role2
    trip1 = create(:trip, host_id: host.id)
    trip2 = create(:trip, host_id: host.id)
    trip3 = create(:trip, host_id: traveler.id)

    #visit '/'

    #click_on 'Listings' #this involves logic in the partial that if they're a host they see Listings, if they're not they see 'Become a Host'

    #expect(current_path).to eq '/host_dashboard'

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    # visit host_dashboard_path(host) <-- i think i want it to be an index
    visit host_dashboard_path

    expect(page).to have_content 'All Reservations'
    expect(page).to have_content 'Status'
    expect(page).to have_content 'Dates and Locations'
    expect(page).to have_content 'Guest'
    expect(page).to have_content 'Details'

    expect(page).to have_selector(".reservation", count: 2)

    expect(page).to have_content 'listing.address'
    expect(page).to have_content 'listing.name'
  end
end

As an authenticated Host
When I click on listings
And I click on “Your Reservations”
Then I should be on “/host/listings/reservations”
And I should see add new reservation button
And I should see my reservations image(s)
And the image should link to the listing's show page
And I should see the property title with a link
And I should see the property location, updated_at
And I should see an "unlisted" button and preview "button"
And I should see my listed properties description(s)
And I should see my listed properties location(s)
And I should see dropdown for unlisted/listed option
And I should see button for link to “listings/preview”