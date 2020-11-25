class FormsController < ApplicationController
  def index
    @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
    @trip = @form.trip
    @user = @form.user
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @form = Form.new(form_params)
    @user = current_user
    @form.trip = @trip
    @form.user = @user

    if @form.save
      redirect_to trip_form_path(@trip, @form)
    else
      render :new
    end
  end

  private

  def form_params
    params.permit(:trip_id, :user_id)
  end
end
