class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]
  def new
    @pair = Pair.find(params[:pair_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pair = Pair.find(params[:pair_id])
    @pair = Pair.find(params[:pair_id])
    if @booking.save
      redirect_to pair_path(@pair)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to root_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :beginning_date, :end_date, :pair_id, :profile_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
