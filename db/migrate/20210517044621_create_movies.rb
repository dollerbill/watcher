# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :streaming_service, null: false
      t.integer :length, null: false
      t.string :user_1_reaction
      t.string :user_2_reaction
      t.string :image_url

      t.timestamps
    end
  end
end
