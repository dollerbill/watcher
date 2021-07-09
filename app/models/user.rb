# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  belongs_to :group

  has_many :user_reactions
  has_many :movies, through: :user_reactions
end
