class TripsController < ApplicationController
  before_action :require_user, only: [:new, :create, :index]

  def index
    @trips = current_user.trips
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @trip = Trip.new()
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.host_id = listing.user_id
    @trip.listing_id = listing.id

    if @trip.save
      flash[:success] = "Your trip at #{listing.name} has been booked."
      redirect_to trips_path
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:trip_status, :start_date, :end_date, :num_guests, :listing_id)
  end

  def listing
    Listing.find(params[:listing_id])
  end
end
