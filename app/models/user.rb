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
    names = group.users.map(&:name)
    return [] if names.count == 1

    names.delete(name)
    names
  end

  def group_ids
    group.users.map(&:id).except(:id)
  end

  def positive_movies
    Movie.joins(:user_reactions)
         .where("user_reactions.reaction = 1 AND user_reactions.user_id = #{id}")
  end

  def recommended
    # TODO: better query
    # Movie.joins(user_reactions: [user: [:group]]).where('user_id like', current_user.id)

    group.users.map do |u|
      { user: u, movies: u.positive_movies & positive_movies }
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
