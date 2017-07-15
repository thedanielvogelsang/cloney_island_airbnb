class SearchController < ApplicationController
  def index
    binding.pry
    # @available_listings = Search.find_listings(params)
    @listings = Listing.search(listing_params)
  end

  private
 
    def listing_params(params)
      params.require(:listing).permit(:city, :state, :zip_code)
    end
end
