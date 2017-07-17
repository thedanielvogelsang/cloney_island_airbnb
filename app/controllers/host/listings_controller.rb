class Host::ListingsController < ApplicationController
  def new
    # host = User.find(params[:user_id])
    host = current_user
    @listing = host.listings.new
  end

  def create
    # host = User.find(params[:user_id])
    host = current_user
    listing = host.listings.new(listing_params)
    amenities = Amenity.list_amenities(amenities_params)
    if listing.save
      listing.amenities << amenities
      redirect_to listing_path(listing)
    else
      flash[:message] = "Unable to create new listing"
      redirect_to new_user_hosts_listing_path(user)
    end
  end

  def edit
    # binding.pry
    # host = User.find(params[:user_id])
    # @listing = Listing.find()
  end

  private

    def listing_params
      params.require(:host)
            .permit(
              :name, :description, :address, :house_rules, :accomodates,
              :bathrooms, :bedrooms, :beds, :price, :property_type,
              :bed_type, :room_type, :pet_type, :cancellation_policy
            )
    end

    def amenities_params
      params.require(:host).require(:listing_amenities)
    end

end
