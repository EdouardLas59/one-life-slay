class BookingsController < ApplicationController
before_action :set_booking, only: [:update, :destroy]

def new
  @movie = Movie.find(params[:movie_id])
  @booking = Booking.new
end

def create
  @movie = Movie.find(params[:movie_id])
  @booking = Booking.new(bookings_params)
  @booking.save
  redirect_to movie_path(@movie)
end

def update
  @movie = @booking.movie
  @booking.uptade(bookings_params)
  redirect_to movie_path(@movie)
end

def destroy
  @movie = @booking.movie
  @booking.destroy
  redirect_to movie_path(@movie)
end

private

def bookings_params
  params.require(:bookings).permit(:location_start, :location_end, :pick_up_place, :total_price, :movie_id, :user_id)
end

def set_booking
 @booking = Booking.find(params[:id])
end

end
