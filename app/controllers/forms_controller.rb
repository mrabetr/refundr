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
    @form = Form.new
    @user = current_user
    @form.trip = @trip
    @form.user = @user

    if @form.save
      redirect_to form_path(@form)
    else
      render :new
    end
  end
end
