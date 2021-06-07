# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :streaming_service, null: false
      t.integer :length, null: false
      t.string :user_1_reaction
      t.string :user_2_reaction
      t.integer :imdb_id, null: false
      t.string :image_url

      t.timestamps
    end

    add_index :movies, :name
    add_index :movies, :streaming_service
    add_index :movies, :user_1_reaction
    add_index :movies, :user_2_reaction
    add_index :movies, :imdb_id
  end
end
