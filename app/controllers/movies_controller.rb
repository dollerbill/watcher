# frozen_string_literal: true

class MoviesController < ApplicationController
  # before_action :require_login
  before_action :set_movie, only: %i[show edit update]

  # GET /movies
  def index
    @movies = Movie.where(user_reaction => 'thumbs_up').limit(50)
    # @movies = Movie.order(Arel.sql('RANDOM()'))
    #                .where(user_reaction => nil)
    #                .limit(5)
  end

  def streaming_service
    @movies = Movie.where(movie_params).limit(50).all
    # TODO: paginate
    render :index
  end

  def rate
    @movie = Movie.order(Arel.sql('RANDOM()'))
                  .where(user_reaction => nil)
                  .first
    # TODO: limit(5) ?
  end

  def recommended
    @movies = Movie.select(&:match?)
  end

  # GET /movies/1
  def show; end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit; end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      redirect_to rate_path
      # redirect_to movies_path
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def movie_params
    params.require(:movie).permit(:name, :streaming_service, :length, :user_1_reaction, :user_2_reaction)
  end

  def user_reaction
    case current_user&.id
    when 1
      :user_1_reaction
    when 2
      :user_2_reaction
    end
  end
end
