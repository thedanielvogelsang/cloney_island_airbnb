class SearchController < ApplicationController
  def index
    @available_listings = Search.find_listings(params)
    binding.pry
  end
end
