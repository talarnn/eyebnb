class PairsController < ApplicationController
  before_action :set_pair, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pairs = Pair.all
  end

  def show
  end

  def new
    @pair = Pair.new
  end

  def create
    @pair = Pair.new(pair_params)
    #doit fonctionner une fois que le sign in sera mis en place
    #changer la ligne ci-dessous plus tard
    @pair.profile_id = User.find(1).id
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
    params.require(:pair).permit(:title, :price, :profile_id, :correction_type, :right_eye_correction, :left_eye_correction)
  end

  def set_pair
    @pair = Pair.find(params[:id])
  end
end
