# frozen_string_literal: true

class MoviesController < ApplicationController
  delegate :previously_rated, :recommended_movies, to: :current_user

  def index
    @movies = Movie.all
  end

  def rate
    @movie = Movie.order(Arel.sql('RANDOM()'))
                  .where.not(id: previously_rated)
                  .first
  end

  def recommended
    @user_movies = recommended_movies
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
