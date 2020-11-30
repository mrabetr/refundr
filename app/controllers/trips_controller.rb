class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.where(user: current_user).order(current: :DESC).limit(3)
  end

  def show
    @receipts = Receipt.where(user: current_user, trip_id: @trip).order(created_at: :desc)
    @form = Form.new
  end

  def new
    @trip = Trip.new
    eu_countries
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    @trip.current = true
    if @trip.save
      current_user.trips.where(current: true).where.not(id: @trip.id).update_all(current: false)
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
    params.require(:trip).permit(:arrival_date, :departure_date, :final_destination, :country)
  end

  def  eu_countries
    @eu_countries = ["BE", "BG", "CZ", "DK", "DE", "EE", "IE", "EL", "ES", "FR", "HR", "IT", "CY", "LV", "LT", "LU", "HU", "MT", "NL", "AT", "PL", "PT", "RO", "SI", "SK", "FI", "SE", "GB"]
  end
end
