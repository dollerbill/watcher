# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string           not null
#  name               :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  streaming_services :string           default([]), not null, is an Array
#  group_id           :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class User < ApplicationRecord
  include Clearance::User

  belongs_to :group

  has_many :invites, foreign_key: :invited_by_user_id
  has_many :user_reactions
  has_many :movies, through: :user_reactions

  def group_names
    group.users.map(&:name) - [name]
  end

  def group_ids
    group.users.map(&:id) - [id]
  end

  def positive_movies
    user_reactions.where(reaction: 1).map(&:movie)
  end

  def previously_rated
    user_reactions.map(&:movie_id)
  end

  def recommended_movies
    (group.users - [self]).map do |user|
      { user:, movies: user.positive_movies & positive_movies }
    end
  end

  def group_name_prefix
    case group_names.count
    when 0
      'You'
    when 1
      "You and #{group_names[0]}"
    else
      "#{group_names.join(', ')}, and you"
    end
  end

  def recommended_watch_message
    "#{group_name_prefix} liked these movies"
  end
end
