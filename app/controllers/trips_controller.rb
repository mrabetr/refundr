class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = Trip.where(user: current_user).order(current: :DESC).limit(3)
  end

  def show
    @receipts = Receipt.where(user: current_user, trip_id: @trip).order(created_at: :desc)
    @form = Form.new
    @VatTotal = 0
    
    metadata = [
      {name: "non-vat", data: {}, stack: "stack 1"},
      {name: "vat", data: {}, stack: "stack 1"}
    ]
    
    @receipts.each do |receipt|
      @vat = ((receipt.total - receipt.total_excl_vat).fractional)/100.to_f
      non_vat = ((receipt.total_excl_vat).fractional)/100.to_f
      shop = receipt.shop
      @VatTotal += @vat
      if metadata[1][:data].has_key?(shop)
        metadata[1][:data][shop] += @vat
      else
        metadata[1][:data][shop] = @vat
      end
      
      if metadata[0][:data].has_key?(shop)
        metadata[0][:data][shop] += non_vat
      else
        metadata[0][:data][shop] = non_vat
      end
    end
    
    @metadata = metadata
    if @trip.current == false
      @currentform = Form.find(params[:id])
    end
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
    eu_countries
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

  def eu_countries
    @eu_countries = ["BE", "BG", "CZ", "DK", "DE", "EE", "IE", "EL", "ES", "FR", "HR", "IT", "CY", "LV", "LT", "LU", "HU", "MT", "NL", "AT", "PL", "PT", "RO", "SI", "SK", "FI", "SE", "GB"]
  end
end
