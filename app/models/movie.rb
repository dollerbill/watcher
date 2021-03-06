# frozen_string_literal: true

# == Schema Information
#
# Table name: movies
#
#  id                 :bigint           not null, primary key
#  name               :string           not null
#  streaming_services :string           not null, is an Array
#  length             :integer          not null
#  image_url          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  imdb_id            :string
#  description        :string
#  release_year       :string
#  image_path         :string
#
class Movie < ApplicationRecord
  has_many :user_reactions
  has_many :users, through: :user_reactions
end
