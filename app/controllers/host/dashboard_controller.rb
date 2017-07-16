class Host::DashboardController < ApplicationController
  def index
    @trips = Trip.where(host_id: current_user.id)
  end
end