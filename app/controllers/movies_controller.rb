# frozen_string_literal: true

class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def rate
    @movie = Movie.order(Arel.sql('RANDOM()'))
                  .where.not(id: previously_rated)
                  .first
  end

  def recommended
    @user_movies = current_user.recommended
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def previously_rated
    Movie.joins(:user_reactions).where(user_reactions: { reaction: 1, user: current_user }).map(&:id)
  end
end
