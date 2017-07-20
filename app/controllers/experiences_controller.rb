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
      @categories = ExperienceCategory.all
    else
      flash[:notice] = "You must have an account to Host an Experience."
      redirect_to login_path
    end
  end

  def create
    @experience = Experience.new(experience_params)

    if @experience.save
      flash[:success] = "Experience created successfully!"
      redirect_to experience_path(@experience)
    else
      flash[:validation] = "Experience didn't validate. Try again."
      redirect_to new_experience_path
    end

  end

  private

    def experience_params
      params.require(:experience)
            .permit(
              :title, :duration, :tagline, :what, :where,
              :provisions, :notes, :group_size, :guest_requirements, :cancellation_policy_type, :user_id, :price, :host_description, :street_address, :city, :state, :zipcode
              )
    end

end
