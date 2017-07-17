require 'rails_helper'

RSpec.describe 'As a traveler' do
  scenario 'I can book a listing from the search results' do
    traveler_role = create(:role)
    traveler = create(:user)
    traveler.roles << traveler_role
    listing = create(:listing, status: 'listed')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(traveler)

    visit "/listings/#{listing.id}"

    expect(page).to have_content listing.name
    expect(page).to have_content listing.accomodates
    expect(page).to have_content listing.beds
    
    user_trips_count = traveler.trips.count

    click_button 'Book Now'

    expect(current_path).to eq("/listings/#{listing.id}/trips/new")
    expect(page).to have_content 'Confirm Your Booking'

    fill_in 'Start Date', with: '2017/08/08'
    fill_in 'End Date', with: '2017/08/12'
    fill_in 'Guests', with: 3
    click_button 'Confirm Booking'

    expect(current_path).to eq("/trips")
    save_and_open_page
    user_new_trips_count = traveler.trips.count
    expect(user_new_trips_count).to be > user_trips_count

    expect(page).to have_content current_user.trips.first.start_date
    expect(page).to have_content current_user.trips.last.start_date
    expect(page).to have_content current_user.trips.first.end_date
    expect(page).to have_content current_user.trips.last.end_date
    expect(page).to have_content current_user.trips.first.listing.name
    expect(page).to have_content listing.name
    expect(page).to have_content listing.address
    expect(page).to have_content listing.user.first_name
    expect(page).to have_content listing.user.phone_number
    expect(page).to have_content listing.user.email
    expect(page).to have_content listing.user.profile_picture


  end

  xscenario 'I can book a listing from the featured listings on the homepage' do
  end

end


#visit the show page and click on a listing that matches search criteria
#click on the listing
#the book a listing form should be autopopulated with search criteria
  #I think this done with a Search#update 
  #so the form is a partial that utilizes the search#update
# After clicking the Book Now
  #the search query has to validate that the dates are available and the amount of guests are allowed
  #If valid, the "Trip" should be created with a 'requested' trip status
  #Once the messaging is implemented, it should ask the traveler to send the host a message 
  #The host should be able to accept or reject the reservation
    #The trip_status should change to accepted or declined
  #The traveler should be able to cancel the reservation before it's accepteed, or cancel and utilize the refund policy to see how much is refunded