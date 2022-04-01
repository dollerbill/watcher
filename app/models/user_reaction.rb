# frozen_string_literal: true

# == Schema Information
#
# Table name: user_reactions
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint           not null
#  user_id    :bigint           not null
#  reaction   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserReaction < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  enum reaction: %i[negative positive]
end
