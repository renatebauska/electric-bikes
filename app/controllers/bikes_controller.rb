class BikesController < ApplicationController
  before_action :set_bike, only: [:edit, :update, :destroy]

  def index
    @bikes = Bike.all

    authorize @bikes
  end

  def new
    @bike = Bike.new

    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)

    authorize @bike

    if @bike.save
      redirect_to bikes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to bikes_path
    else
      render :edit
    end
  end

  def destroy
    @bike.destroy

    redirect_to bikes_path
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])

    authorize @bike
  end

  def bike_params
    params.require(:bike)
      .permit(:name, :available)
  end
end
