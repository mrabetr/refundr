class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @trip = Trip.where(user: current_user, current: true)
  end
end
