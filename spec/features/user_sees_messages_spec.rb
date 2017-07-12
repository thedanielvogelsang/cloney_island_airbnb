require 'rails_helper'

RSpec.describe "On Messages Show Page" do
  before(:each) do
    host = create(:host_user_with_listings)
    traveler = create(:traveler_user)
    listing = create(:listing_with_trip_and_conversation_with_messages, traveler_id: traveler.id, host_id: host.id)#????
    trip = listing.trips.first
    conversation = listing.conversations.first
    latest_message = conversation.messages.last
  end

  it "host can view traveler's profile with trip details" do
    visit conversation_path(trip.conversation)

    expect(page).to have_content("Message Show Page")
    expect(page).to have_css("img[src=\"#{traveler.image}\"]")
    expect(page).to have_content(traveler.first_name)
    expect(page).to have_content(traveler.city_and_state)
    expect(page).to have_content("#{traveler.verifications} verifications")
    expect(page).to have_content("Email: #{traveler.email}")
    expect(page).to have_content("Email: #{traveler.phone_number}")
    expect(page).to have_content("Trip details")
    expect(page).to have_content(listing.description)
    expect(page).to have_content(trip.start_date)
    expect(page).to have_content(trip.end_date)
    expect(page).to have_content("Guests")
    expect(page).to have_content(trip.num_guests)
    #Confirmation Code??
    expect(page).to have_content("Address")
    expect(page).to have_content(listing.prettyfy_address)
    expect(page).to have_content("Payment")
    expect(page).to have_content("$#{listing.price} x #{trip.duration} nights")
    expect(page).to have_content("$#{trip.total_price}")
  end

  it "hosts can read traveler messages" do
    visit conversation_path(conversation)

    expect(page).to have_content(latest_message.content)
    expect(page).to have_content(latest_message.created_at)
    expect(page).to have_css(".message_box")
  end

  it "hosts can send traveler messages" do
    visit conversation_path(conversation)

    expect(page).to have_css('.message_boxes')
    fill_in "Message", with: "Hey that sounds great!"
    click_button "Send Message"

    expect(current_path).to eq("/conversations/#{conversation.id}")
    expect(page).to have_content("Hey that sounds great!")
    #Somehow test that the host's photo shows up or however we want the conversation designed
  end
end

As an authenticated Host
When a Traveler requests a reservation
I can send the Traveler messages
As an authenticated Host
When a Traveler books my property
I can message the Traveler
