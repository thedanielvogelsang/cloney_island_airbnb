class ListingsController < ApplicationController
  def index
     location = params['search_address']
     @results = Airbnb.find_properties(location)
  end

  def show
    if Listing.exists?(params[:id])
      @listing = Listing.find(params[:id])
    else
      @listing = Airbnb.find(params[:id])
    end
  end
end
