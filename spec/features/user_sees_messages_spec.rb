require 'rails_helper'

RSpec.describe "On Messages Show Page" do
  before(:each) do
    host = create(:host_user_with_listings)
    traveler = create(:traveler_user)
    listing = create(:listing_with_conversation_with_messages, traveler_id: traveler.id, host_id: host.id)#????
    latest_message = conversation.messages.last
  end

  it "host can view traveler's profile with trip details" do
    visit conversation_path(trip.conversation)

    expect(page).to have_content(traveler.first_name)
    expect(page).to have_content(traveler.city_and_state)
    expect(page).to have_content("#{traveler.verifications} verifications")
    expect(page).to have_content("Email: #{traveler.email}")
    expect(page).to have_content("Email: #{traveler.phone_number}")
    expect(page).to have_content("Trip details")
    expect(page).to have_content("Trip details")


  end

  it "hosts can read traveler messages" do
    visit conversation_path(conversation)

    expect(page).to have_content(latest_message.content)
    expect(page).to have_content(latest_message.created_at)



  end
end


As an authenticated Host
When a Traveler messages me
I can read and reply
As an authenticated Host
When a Traveler requests a reservation
I can send the Traveler messages
As an authenticated Host
When a Traveler books my property
I can message the Traveler
