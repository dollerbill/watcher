# frozen_string_literal: true

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

  def recommended_movies
    group.user_reactions.positive.map(&:movie_id).then do |reaction|
      reaction.select { |r| reaction.count(r) == group.users.count }.uniq
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
