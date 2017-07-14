class Hosts::ListingsController < ApplicationController
  def new
    user = User.find(params[:user_id])
    @listing = user.listings.new
  end

  def create
    binding.pry
  end
end