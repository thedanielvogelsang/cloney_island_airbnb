class ListingsController < ApplicationController
  def index
    @listings = Listing.all.limit(20)
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
