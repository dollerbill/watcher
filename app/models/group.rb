# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Group < ApplicationRecord
  has_many :users
  has_many :user_reactions, through: :users
  has_many :movies, through: :user_reactions

  def user_ids
    users.map(&:id)
  end

  def positive_movies
    user_reactions.where(reaction: 1).map(&:movie)
  end
end
