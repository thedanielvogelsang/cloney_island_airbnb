class ListingsController < ApplicationController
  def index
    location = params['search_address'] || 'denver'
    gon.search_location = location
    @results = Airbnb.find_properties(location)
    @listings = Listing.all
  end

  def show
    if Listing.exists?(params[:id])
      @listing = Listing.find(params[:id])
    else
      @listing = Airbnb.find(params[:id])
    end
  end
end
