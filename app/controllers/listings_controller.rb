class ListingsController < ApplicationController
  def index
    @listings = Listing.all.limit(20)
  end
end
