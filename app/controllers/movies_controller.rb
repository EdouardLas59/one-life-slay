class MoviesController < ApplicationController

  skip_before_action :authenticate_user!, only: :show

  def index
    @movies = Movie.all

  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
    @booking = Booking.new
  end

end
