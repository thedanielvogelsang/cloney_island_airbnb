class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    if current_user
      @experience = Experience.new
    else
      flash[:notice] = "You must have an account to Host an Experience."
      redirect_to login_path
    end
  end

end
