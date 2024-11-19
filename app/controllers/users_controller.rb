class UsersController < ApplicationController

def display_bookings
  @bookings = current_user.bookings
end

end
