require 'rails_helper'

RSpec.describe "On Messages Show Page" do
  before(:each) do
    host = create(:host_user_with_listings)
    traveler = create(:traveler_user)

  end

  it "once a traveler requests to book, a conversation begins" do
    current_user = traveler.id# i forgot how to do this part, ran out of time to look up

    listing = create(:listing, user_id: host.id)
    new_conversation = traveler.conversations.find_by(host_id: host.id)
    expect(new_conversation).to eq(nil)

    visit listing_path(listing)

    click_on "Request to Book"

    expect(new_conversation.host_id).to eq(host.id)
  end

  it "hosts can read traveler messages" do
    listing = create(:listing_with_trip_and_conversation_with_messages, traveler_id: traveler.id, host_id: host.id)#????
    trip = listing.trips.first
    conversation = listing.conversations.first
    latest_message = conversation.messages.last

    visit conversation_path(conversation)

    expect(page).to have_content(latest_message.content)
    expect(page).to have_content(latest_message.created_at)
    expect(page).to have_css(".content_message_box")
  end

  it "hosts can send traveler messages" do
    current_user = host.id

    listing = create(:listing_with_trip_and_conversation_with_messages, traveler_id: traveler.id, host_id: host.id)#????
    trip = listing.trips.first
    conversation = listing.conversations.first
    latest_message = conversation.messages.last

    visit conversation_path(conversation)

    expect(page).to have_css('.empty_message_box')
    fill_in "Message", with: "Hey that sounds great!"
    click_button "Send Message"

    expect(current_path).to eq("/conversations/#{conversation.id}")
    expect(page).to have_content("Hey that sounds great!")
    #Somehow test that the host's photo shows up or however we want the conversation designed
  end

  it "once a conversation begins, a host can confirm the reservation" do
    current_user = host.id

    listing = create(:listing_with_trip_and_conversation_with_messages, traveler_id: traveler.id, host_id: host.id)#????
    trip = listing.trips.first

    expect(trip.confirmed?).to eq(false)

    visit conversation_path(trip.conversation)

    click on "Confirm Trip"

    expect(trip.confirmed?).to eq(true)
  end

  it "host can view traveler's profile with trip details" do
    listing = create(:listing_with_trip_and_conversation_with_messages, traveler_id: traveler.id, host_id: host.id)#????
    trip = listing.trips.first
    conversation = listing.conversations.first
    latest_message = conversation.messages.last

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
end
