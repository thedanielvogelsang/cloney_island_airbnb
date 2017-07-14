class Search < ApplicationRecord

  def self.find_listings(params)
    if params['zipcode'].empty?
      Listing.find_by_sql("SELECT * FROM listings JOIN addresses ON listings.address_id = addresses.id WHERE addresses.city LIKE '#{params['city']}' AND addresses.state = '#{params['state']}'")
    else
      listings = Listing.find_by_sql("SELECT * FROM listings JOIN addresses ON listings.address_id = addresses.id WHERE addresses.zip_code = '#{params['zipcode']}'")
    end
  end
end
