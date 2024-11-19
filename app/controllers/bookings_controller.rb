class BookingsController < ApplicationController
before_action :set_booking, only: [:update, :destroy]

def new
  @movie = Movie.find(params[:movie_id])
  @booking = Booking.new
end

def create
  @movie = Movie.find(params[:movie_id])
  @booking = Booking.new(booking_params)
  @booking.movie = @movie
  @booking.user = User.first
  # remplacer par current user
  if @booking.save
    redirect_to root_path
    # replacer par movie_path(@movie)
  else
    render :new, status: :unprocessable_entity
  end

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

def booking_params
  params.require(:booking).permit(:date_start, :date_end)
  # ajouter total_price et pickup_place
end

def set_booking
 @booking = Booking.find(params[:id])
end

end
