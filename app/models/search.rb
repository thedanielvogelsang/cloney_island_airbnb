class Search < ApplicationRecord

  def self.find_listings(params)
    if params['zipcode'].empty?
      listings = Listing.find_by_sql("SELECT * FROM listings JOIN addresses ON listings.address_id = addresses.id WHERE addresses.city LIKE '#{params['city']}' AND addresses.state = '#{params['state']}'")
    else
      listings = Listing.find_by_sql("SELECT * FROM listings JOIN addresses ON listings.address_id = addresses.id WHERE addresses.zip_code = '#{params['zipcode']}'")
    end
    listings_available(listings, params)
  end

  def self.listings_available(listings, params)
    available_listings = []
    listings.each do |listing|
      available_listings << listing unless any_trips_overlap_request(listing, params)
    end
    available_listings
  end

  private

    def self.any_trips_overlap_request(listing, params)
      start_date = params['check_in'].to_date
      end_date = params['check_out'].to_date

      listing.trips.any? do |trip|
        overlaps(trip, start_date, end_date)
      end
    end

    def self.overlaps(trip, start_date, end_date)
      (trip.start_date - end_date) * (start_date - trip.end_date) >= 0
    end

end

#all listings that don't have trips within the dates requested
