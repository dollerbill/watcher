# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update]

  # GET /movies
  def index
    @movies = Movie.all
  end

  def rated
    if current_user.has_rated?
      @movies = Movie.joins(:user_reactions).where(user_reactions: { reaction: 1 })
      @movies = @movies.where(movie_params) if params['movie']
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
    previously_rated = current_user.user_reactions.map(&:movie_id)

    @movie = Movie.order(Arel.sql('RANDOM()'))
                  .where.not(id: previously_rated)
                  .first
  end

  def recommended
    ids = current_user.group.user_reactions.positive.map(&:movie_id).then do |r|
      r.select { |e| r.count(e) == current_user.group.users.count }.uniq
    end
    @movies = Movie.where(id: ids)
    Movie.joins(:user_reactions, :user, :group)
    # one sql query/ join
  end

  def show; end

  def new
    @movie = Movie.new
  end

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

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :streaming_service, :length)
  end
end
