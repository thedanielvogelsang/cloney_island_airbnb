class AirbnbService

  attr_reader :location

  def initialize(location)
    @location = location
    @conn = Faraday.new(url: "https://www.airbnb.com/") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["airbnb_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_properties
    get_url("/api/v2/search_results?client_id=#{ENV['airbnb_key']}&locale=en-US&currency=USD&_format=for_search_results_with_minimal_pricing&_limit=10&_offset=0&fetch_facets=true&guests=1&ib=false&ib_add_photo_flow=true&location=#{location}US&min_bathrooms=0&min_bedrooms=0&min_beds=1&min_num_pic_urls=10&price_max=210&price_min=40&sort=1&user_lat=37.3398634&user_lng=-122.0455164")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:search_results]
  end

  def self.find_properties(location)
    new(location).find_properties
  end
end