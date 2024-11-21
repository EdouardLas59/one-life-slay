class DashboardController < ApplicationController


  def index
    @users = User.all
    # The `geocoded` scope filters only flats with coordinates
    
  end


def show
  @bookings = current_user.bookings
end


end
