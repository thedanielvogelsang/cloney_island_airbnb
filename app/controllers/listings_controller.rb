class ListingsController < ApplicationController
  def index
    location = params['search_address']
    gon.search_location = location || 'denver'
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
