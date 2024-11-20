class MoviesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @movies = Movie.all
  end

  def search
    @query = params[:movie]
    if @query.present?
      @movies = Movie.where('title LIKE ?', "%#{@query}%")
    else
      @movies = []
    end
  end

  def new
    @movie = Movie.new()
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @newmovie = @movie.new(movie_params)
    # redirect to a remplir
  end

  def show
    @movie = Movie.find(params[:id])
    @booking = Booking.new
  end

end

private

def movie_params
  params.require(:movie).permit(:title, :poster_url, :director, :actors, :genre, :year, :rating, :quality, :price )

end
