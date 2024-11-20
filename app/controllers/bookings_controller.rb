class BookingsController < ApplicationController
before_action :set_booking, only: [:update, :destroy]

def new
  @movie = Movie.find(params[:movie_id])
  @booking = Booking.new
  @marker = [{lat: 50.63665114038645, lng: 3.0260790988325503},
   {lat: 50.63371842449306, lng: 3.005903172838499},
   { lat: 50.64008194209106, lng: 3.0188359669213267}
];
  @marker_user = {lat: current_user.latitude,lng: current_user.longitude}

end

def create
  @movie = Movie.find(params[:movie_id])
  @booking = Booking.new(booking_params)
  @booking.movie = @movie
  @booking.user = User.first
  # remplacer par current user
  if @booking.save
    redirect_to dashboard_index_path
  else
    render :new, status: :unprocessable_entity
  end

end

def update
  @movie = @booking.movie
  @booking.uptade(bookings_params)
  redirect_to dashboard_index_path
end

def destroy
  @movie = @booking.movie
  @booking.destroy
  redirect_to dashboard_index_path
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
