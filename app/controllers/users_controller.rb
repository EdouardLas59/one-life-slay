class UsersController < ApplicationController


  def index
    @users = Users.all
    # The `geocoded` scope filters only flats with coordinates
  end


def show
  @bookings = current_user.bookings
end


end
