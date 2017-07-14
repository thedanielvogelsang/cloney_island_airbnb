class SearchController < ApplicationController
  def index
    @listings = Search.find_listings(params)
  end
end
