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
end
