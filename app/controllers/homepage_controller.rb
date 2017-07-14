class HomepageController < ApplicationController
  def index
    @listings = Listing.limit(4).order("RANDOM()")
  end
end
