class TripsController < ApplicationController

  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
    @receipts = Receipt.where(trip_id: @trip).order(created_at: :desc)
    # @receipt = Receipt.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  private


  def trip_params
    params.require(:trip).permit(:arrival_date, :departure_date, :final_destination)
  end
end
