# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :user_reactions
  has_many :users, through: :user_reactions
end
