class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @trip = Trip.where(user: current_user, current: true)
  end

  def weather
    # binding.pry
    session[:temperature] = params[:temp_data]
    session[:city] = params[:city_data]
    session[:country] = params[:country_data]
    session[:icon] = params[:icon_data]
  end
end
