require 'faraday-manual-cache'

class AirbnbService
  def initialize
    @conn = Faraday.new(url: "https://www.airbnb.com/") do |faraday|
        faraday.headers["X-API-KEY"] = ENV["airbnb_key"]
        faraday.use :manual_cache,
                    expires_in: 50
        faraday.adapter Faraday.default_adapter
    end
  end

  def self.find_listing(id)
    new.find_listing(id)
  end

  def find_listing(id)
    response = @conn.get("/api/v2/listings/#{id}?client_id=#{ENV['airbnb_key']}&_format=v1_legacy_for_p3&locale=en-US&_source=mobile_p3&number_of_guests=1")
    result = JSON.parse(response.body, symbolize_names: true)
    listing = Airbnb.new(result)
  end

  def self.generate_host_by_listing_id(id)
    new.generate_host_by_listing_id(id)
  end

  def generate_host_by_listing_id(id)
    response = @conn.get("/api/v2/listings/#{id}?client_id=#{ENV['airbnb_key']}&_format=v1_legacy_for_p3&locale=en-US&_source=mobile_p3&number_of_guests=1")
    result = JSON.parse(response.body, symbolize_names: true)
    host = AirbnbHost.create_host(result[:listing][:user][:user], id)
  end

  def self.find_listings(id_array)
    new.find_listings(id_array)
  end

  def find_listings(id_array)
    listings = []
    id_array.each do |id|
      listings << find_listing(Listing.find(id).airbnb_id)
    end
    listings
  end
end
