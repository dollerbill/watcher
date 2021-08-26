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
    ids = current_user.group.user_reactions.positive.map(&:movie_id).then do |r|
      r.select { |e| r.count(e) == current_user.group.users.count }.uniq
    end
    @movies = Movie.where(id: ids)
    render :rate_movies if @movies.empty?

    # one sql query/ join
    # Movie.joins(user_reactions: [user: [:group]]).where('user_id like', current_user.id).count
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def previously_rated
    Movie.joins(:user_reactions)
         .where("user_reactions.reaction = 1 AND user_reactions.user_id = #{current_user.id}")
         .map(&:id)
  end
end
