class Hosts::ListingsController < ApplicationController
  def new
    host = User.find(params[:user_id])
    @listing = host.listings.new
  end

  def create
    user = User.find(params[:user_id])
    address = Address.new(address_params, user_id: user.id)
    
    listing = Listing.new(listing_params)
    # listing.address_id = address.id 
    listing.user_id = user.id
    binding.pry
    if listing.save
      binding.pry
      redirect_to listing_path(listing)
    else
      flash[:message] = "Unable to create new listing"
      redirect_to new_user_hosts_listing_path(user)
    end
  end

  private

    def listing_params
      params.require(:host)
            .permit(
              :name, :description, :house_rules, :accomodates,
              :bathrooms, :bedrooms, :beds, :price, :property_type,
              :bed_type, :room_type, :pet_type
            )
    end

    def address_params
      params.require(:host).require(:address)
            .permit(
              :street_address, :street_address_2, :city, :state, :zip_code
            )
    end
    
end