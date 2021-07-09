# frozen_string_literal: true

class UserReactionsController < ApplicationController
  def rate
    @reaction = UserReaction.new(user_reaction_params)

    if @reaction.save
      redirect_to root_path
    else
      render 'movies/index'
    end
  end

  private

  def user_reaction_params
    params.require(:user_reaction).permit(:movie_id, :reaction, :user_id)
  end
end
