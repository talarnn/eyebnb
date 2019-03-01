class ProfilesController < ApplicationController
  before_action :set_profile

  def show
  end

  def dashboard
    unless current_user.profile == @profile
      redirect_to profile_path(@profile)
    end
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
    @profile = User.find(params[:id]).profile
  end

  def profile_params
    params.require(:profile).permit(:profile_pic)
  end
end
