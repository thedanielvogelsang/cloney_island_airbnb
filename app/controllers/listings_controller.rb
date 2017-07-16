class ListingsController < ApplicationController
  def index
    if params[:search_address] != ""
      @listings = Listing.search_address(params[:search_address])
    else
      flash[:message] = "Unable to find listings related to your search."
      @listings = []
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
