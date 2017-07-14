class SearchController < ApplicationController
  def index
    listings = Listing.find_by_sql("SELECT listings.id FROM listings JOIN addresses ON listings.address_id = addresses.id WHERE addresses.city LIKE '#{params['city']}' AND addresses.state = '#{params['state']}'")
  end
end
