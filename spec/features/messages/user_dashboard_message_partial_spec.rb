require 'rails_helper'

RSpec.describe "On User Dashboard Page" do
  it "user can view message partial" do
    skip
    traveler = create(:user)
    listing1 = create(:listing_with_trip, traveler_id: traveler.id, host_id: host1.id)#????
    trip1 = listing1.trips.first
    listing2 = create(:listing_with_trip, traveler_id: traveler.id, host_id: host2.id)#????
    trip2 = listing2.trips.first
    conversation1 = create(:conversation, content: "I really can't wait to see your place mate, it sounds sweet as! I've never been to North America before")
    trip1.conversation = conversation1
    conversation2 = create(:conversation, content: "I really can't wait to see your place mate, it sounds sweet as! I've never been to North America before")
    trip2.conversation = conversation2

    current_user = traveler.id

    visit user_dashboard(traveler)

    expect(page).to have_content(host1.name)
    expect(page).to have_content(conversation1.updated_at)
    expect(page).to have_content(conversation1.shortened_content)
    expect(page).to have_content(listing1.prettyfy_address)
    expect(page).to have_content(trip1.prettyfy_duration)
    expect(page).to have_content(trip1.confirmed)
    expect(page).to have_content(trip1.total_price)

    expect(page).to have_content(host2.name)
    expect(page).to have_content(conversation2.updated_at)
    expect(page).to have_content(conversation2.shortened_content)
    expect(page).to have_content(listing2.prettyfy_address)
    expect(page).to have_content(trip2.prettyfy_duration)
    expect(page).to have_content(trip2.confirmed)
    expect(page).to have_content(trip2.total_price)
  end
end
