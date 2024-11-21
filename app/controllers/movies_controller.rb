class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    if params[:genre].present?
      @movies = Movie.where(genre: params[:genre])
    elsif params[:query].present?
      @movies = Movie.where('title ILIKE ?', "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
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
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
    # redirect_to new_dashboard_path
    redirect_to dashboard_index_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @booking = Booking.new
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :poster_url, :director, :actors, :genre, :year, :rating, :quality, :price )
  end
end
