class PairsController < ApplicationController
  before_action :set_pair, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pairs = Pair.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @pair = Pair.new
  end

  def create
    @pair = Pair.new(pair_params)
    @pair.remote_picture_url = 'https://cdn.trendhunterstatic.com/thumbs/ksubi-eyewear-sigma.jpeg' unless @pair.picture
    @pair.profile_id = current_user.profile.id
    if @pair.save
      redirect_to pair_path(@pair)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @pair.update(pair_params)
      redirect_to pair_path(@pair)
    else
      render :edit
    end
  end

  def destroy
    @pair.destroy
    redirect_to root_path
  end

  private

  def pair_params
    params.require(:pair).permit(
      :title,
      :brand,
      :price,
      :profile_id,
      :correction_type,
      :right_eye_correction,
      :left_eye_correction,
      :picture
    )
  end

  def set_pair
    @pair = Pair.find(params[:id])
  end
end
