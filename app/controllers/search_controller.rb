class SearchController < ApplicationController
  def index
    @available_listings = Search.find_listings(params)
  end
end
