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
    @marker = [{lat: 50.63665114038645, lng: 3.0260790988325503, info_window_html: render_to_string(partial: "info_window", locals: {marker:"address 1" })
  },
    {lat: 50.63371842449306, lng: 3.005903172838499, info_window_html: render_to_string(partial: "info_window", locals: {marker: "address 2"})},
    { lat: 50.64008194209106, lng: 3.0188359669213267, info_window_html: render_to_string(partial: "info_window", locals: {marker: "address 3"})}
    ];
    @marker_user = {lat: current_user.latitude,lng: current_user.longitude}
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :poster_url, :director, :actors, :genre, :year, :rating, :quality, :price )
  end
end
