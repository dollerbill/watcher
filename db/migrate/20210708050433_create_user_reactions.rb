# frozen_string_literal: true

class CreateUserReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_reactions do |t|
      t.references :movie, null: false
      t.references :user, null: false
      t.integer :reaction, null: false, index: true

      t.timestamps
    end
  end
end
