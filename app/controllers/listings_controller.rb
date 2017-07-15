class ListingsController < ApplicationController
  def index
    if params[:search_city] != "" && params[:search_state] != ""
      @listings = Listing.search_city(params)
    elsif params[:search_zip] != ""
      @listings = Listing.search_zip(params)
    else
      @listings = Listing.all.limit(20)
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
