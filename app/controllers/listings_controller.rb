class ListingsController < ApplicationController
  def index
     location = params['search_address']
     @results = Airbnb.find_properties(location)
  end

  def show
    if params[:search_address] || params[:airbnb]
      @listing = Airbnb.find(params[:id])
    end
  end
end
