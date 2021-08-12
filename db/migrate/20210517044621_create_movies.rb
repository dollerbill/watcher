# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false, index: true
      t.string :streaming_service, null: false, index: true
      t.integer :length, null: false
      t.integer :imdb_id, null: false, index: true
      t.string :image_url

      t.timestamps
    end
  end
end
