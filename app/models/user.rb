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

  def recommended_watch_message
    case group_names.count
    when 0
      'You liked these movies: '
    when 1
      "You and #{group_names[0]} both liked these movies: "
    else
      "#{group_names.join(', ')}, and you all liked these movies: "
    end
  end
end
