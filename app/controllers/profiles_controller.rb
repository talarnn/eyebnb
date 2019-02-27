class ProfilesController < ApplicationController
  before_action :set_profile
  
  def show
  end

  def dashboard
    @profile_bookings = @profile.bookings
    @profile_pairs = @profile.pairs
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:profile_pic)
  end
end
