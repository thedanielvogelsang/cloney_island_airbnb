class Hosts::ListingsController < ApplicationController
  def new
    host = User.find(params[:user_id])
    @listing = host.listings.new
  end

  def create
    binding.pry
  end
end