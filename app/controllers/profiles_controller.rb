class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def dashboard
    @profile = Profile.find(params[:id])
    @pairs = @profile.pairs
    @bookings = @profile.bookings
  end
end
