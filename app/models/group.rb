# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :users
  has_many :user_reactions, through: :users
  has_many :movies, through: :user_reactions

  def match?
    user_reactions.select(&:movie).select(&:positive?)
  end
end
