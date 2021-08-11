# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  belongs_to :group

  has_many :invites, foreign_key: :invited_by_user_id
  has_many :user_reactions
  has_many :movies, through: :user_reactions

  def has_rated?
    user_reactions.positive.any?
  end
end
