require 'rails_helper'

RSpec.describe 'As a traveler' do
  scenario 'I can book a listing from the search results' do
  end

  scenario 'I can book a listing from the featured listings on the homepage' do
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