class TripsController < ApplicationController
  before_action :require_user, only: [:new, :index]

  def index
    @trips = current_user.trips
  end

  def new
    @listing = AirbnbService.find_listing(params[:listing_id])
    @trip = Trip.new()
    binding.pry
  end

  def create
    @listing = AirbnbService.find_listing(params[:id])
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    @trip.host_id = generate_host_id
    @trip.listing_id = @listing.listing_id
    binding.pry
    date_search = {'search_start_date' => params[:trip][:start_date], 'search_end_date' => params[:trip][:end_date]}
    if Search.existing_trips_overlap_request(current_user, date_search) == false
      if @trip.save
        Conversation.create(trip_id: @trip.id)
        flash[:success] = "Your trip at #{@listing.name} has been booked."
        redirect_to trips_path
      else
        render :new
      end
    else
      flash[:failure] = "This listing is already booked during the dates you selected."
      render :new
    end
  end

  def update
    trip = Trip.find(params[:id])
    trip.update_attributes(trip_status: params[:trip_status])
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:trip_status, :start_date, :end_date, :num_guests, :listing_id)
  end

  def listing
    Listing.find(params[:listing_id])
  end
end
