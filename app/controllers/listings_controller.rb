class ListingsController < ApplicationController
  def index
    # if params[:search_address] != "" && params[:search_num_guests] != "" && (params['search_start_date'] != "" && params[:search_end_date] != "" && params[:search_num_guests] != "")
    #   preliminary_listings = Listing.search_address_and_num_guests(params)
    #   @listings = Search.listings_available(preliminary_listings, params)
    # elsif params[:search_address] != "" && params[:search_num_guests] != ""
    #   @listings = Listing.search_address_and_num_guests(params)
    # elsif
    #   @listings = Listing.search_address(params[:search_address])
    # else
    #   flash[:message] = "Unable to find listings related to your search."
    #   @listings = []
    # end
    # if @listings.empty?
    #   @listings = Listing.all
    # end

     location = params['search_address']
     @results = Airbnb.find_properties(location)
     # @conn = Faraday.new(url: "https://www.airbnb.com/") do |faraday|
     #     faraday.headers["X-API-KEY"] = ENV["airbnb_key"]
     #     faraday.adapter Faraday.default_adapter
     # end
     #
     # response = @conn.get("/api/v2/search_results?client_id=#{ENV['airbnb_key']}&locale=en-US&currency=USD&_format=for_search_results_with_minimal_pricing&_limit=10&_offset=0&fetch_facets=true&guests=1&ib=false&ib_add_photo_flow=true&location=#{location}US&min_bathrooms=0&min_bedrooms=0&min_beds=1&min_num_pic_urls=10&price_max=210&price_min=40&sort=1&user_lat=37.3398634&user_lng=-122.0455164")
     #
     # results = JSON.parse(response.body, symbolize_names: true)[:search_results]
     # @results = results.map do |result|
     #    Airbnb.new(result)
     # end
  end

  def show
    if params[:search_address]
      @result = Airbnb.find(params[:id])
    else
      @listing = Listing.find(params[:id])
    end
  end
end
