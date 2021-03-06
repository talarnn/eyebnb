class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy, :increment_status, :decrement_status]
  def new
    @pair = Pair.find(params[:pair_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(status: 1, beginning_date: Date.parse(params["booking"]["beginning_date"]), end_date: Date.parse(params["booking"]["end_date"]))
    @booking.pair = Pair.find(params[:pair_id])
    @pair = Pair.find(params[:pair_id])
    @booking.profile_id = current_user.profile.id
    if @booking.save
      redirect_to dashboard_path(current_user.profile)
    else
      render :new
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_path(current_user.profile)
  end

  def increment_status
    @booking.status += 1
    @booking.save
    redirect_to dashboard_path(current_user.profile)
  end

  def decrement_status
    @booking.status -= 1
    @booking.save
    redirect_to dashboard_path(current_user.profile)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path(current_user.profile)
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :beginning_date, :end_date, :pair_id, :profile_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
