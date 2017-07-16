class Host::ListingsController < ApplicationController
  def new
    binding.pry
    host = User.find(params[:user_id])
    @listing = host.listings.new
  end

  def create
    host = User.find(params[:user_id])
    address = host.addresses.find_or_create_by(street_address: params[:host][:address][:street_address])
    address.update_attributes(address_params)
    listing = host.listings.new(listing_params)
    # policy_name = params[:host][:cancellation][:name]
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