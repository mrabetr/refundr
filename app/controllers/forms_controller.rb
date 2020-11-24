class FormsController < ApplicationController
  def show
    @form = Form.find(params[:id])
    @trip = @form.trip
    @user = @form.user
  end

  def new
    @form = Form.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @form = Form.new
    @trip = Trip.find(params[:trip_id])
    @user = current_user
    @form.trip = @trip
    @form.user = @user

    if @form.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end
end
