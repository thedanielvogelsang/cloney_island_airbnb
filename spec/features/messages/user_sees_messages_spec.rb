require 'rails_helper'

RSpec.describe "On Messages Show Page" do

  it "once a traveler requests to book, a conversation begins" do
    User.destroy_all
    traveler = create(:user)
    role = create(:role, name: "host")
    host = create(:user)
    host.roles << role
    listing = create(:listing, user_id: host.id)

    new_conversation = traveler.trips
    expect(traveler.trips).to eq([])

    visit listing_path(listing)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(traveler)

    click_on "Book Now"

    fill_in "Start Date", with: "#{Date.today + 3}"
    fill_in "End Date", with: "#{Date.today + 5}"
    fill_in "Guests", with: 3

    click_on "Confirm Booking"

    expect(listing.trips.first.conversation.created_at.to_date).to eq(Time.now.utc.to_date)
  end

  it "hosts can read traveler messages" do
    skip
    current_user = host.id

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
    skip
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
end
