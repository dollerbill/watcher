# frozen_string_literal: true

class MoviesController < ApplicationController
  # before_action :require_login
  before_action :set_movie, only: %i[show edit update]

  # GET /movies
  def index
    @movies = Movie.all
  end

  def rated_movies
    if current_user.user_reactions.any?
      @movies = current_user.user_reactions.positive.map(&:movie)
    else
      render :rate_movies
    end

  # @movies = Movie.order(Arel.sql('RANDOM()'))
  #                .where(user_reaction => nil)
  #                .limit(5)
end

  def streaming_service
    @movies = Movie.where(movie_params).limit(50)
    # TODO: paginate
    render :index
  end

  def rate
    previously_rated = current_user&.user_reactions&.map(&:movie_id)

    @movie = Movie.order(Arel.sql('RANDOM()'))
                  .where.not(id: previously_rated)
                  .first
  end

  def recommended
    # TODO: user.group_id ||= Group.create.id
    @movies = current_user.group.user_reactions.positive.map(&:movie)
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
      # redirect_to root_path
      redirect_to movies_path
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
    params.require(:movie).permit(:name, :streaming_service, :length)
  end
end
