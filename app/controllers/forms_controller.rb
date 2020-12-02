class FormsController < ApplicationController
  def index
    @forms = Form.where(user: current_user)
  end

  def show
    @form = Form.find(params[:id])
    @trip = @form.trip
    @user = @form.user
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @form = Form.new
    @user = current_user
    @form.trip = @trip
    @form.user = @user
    @trip.update(current: false)
    if @form.save
      redirect_to form_path(@form)
    else
      render :new
    end
  end

  def display
    @form = Form.find(params[:form_id])
    @trip = @form.trip
    @user = @form.user
  end
end
