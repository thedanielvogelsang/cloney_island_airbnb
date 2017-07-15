class SearchController < ApplicationController
  def index
    binding.pry
    # @available_listings = Search.find_listings(params)
    @listings = Listing.search(listing_params)
  end
end
