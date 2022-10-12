# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false, index: true
      t.string :streaming_services, array: true, null: false, default: []
      t.integer :length, null: false
      t.string :imdb_id
      t.string :image_url

      t.timestamps
    end
  end
end
