# frozen_string_literal: true

class UserReaction < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  enum reaction: %i[negative positive]
end
