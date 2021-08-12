# frozen_string_literal: true

class AddImdbidToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :imdb_id, :string
  end
end
