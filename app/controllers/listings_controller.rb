class ListingsController < ApplicationController
  def index
    if params[:search_address] != "" && params[:search_num_guests] != "" && (params['search_start_date'] != "" && params[:search_end_date] != "" && params[:search_num_guests] != "")
      preliminary_listings = Listing.search_address_and_num_guests(params)
      @listings = Search.listings_available(preliminary_listings, params)
    elsif params[:search_address] != "" && params[:search_num_guests] != ""
      @listings = Listing.search_address_and_num_guests(params)
    elsif params[:search_address]
      @listings = Listing.search_address(params[:search_address])
    else
      flash[:message] = "Unable to find listings related to your search."
      @listings = []
    end
    if @listings.empty?
      @listings = Listing.all
    end
    @geojson = Array.new
    build_geojson(@listings, @geojson)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  respond_to do |format|
    format.html
    format.json {render json: @geojson}
  end

  def build_geojson(listings, geojson)
    listings.each do |listing|
      geojson << GeojsonBuilder.build_listing(listing, geojson)
    end
  end
end
