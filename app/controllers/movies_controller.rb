class MoviesController < ApplicationController
  
  def index
    @movie = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
