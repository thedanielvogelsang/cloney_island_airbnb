class ListingsController < ApplicationController
  def index

  end

  def show
    @listing = Listing.find(params[:id])
  end
end
