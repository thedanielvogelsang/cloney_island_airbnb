class AirbnbService
  def initialize
    @conn = Faraday.new(url: "https://www.airbnb.com/") do |faraday|
        faraday.headers["X-API-KEY"] = ENV["airbnb_key"]
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
    # fetch_facets=true&&ib=false&ib_add_photo_flow=true
  end
end
