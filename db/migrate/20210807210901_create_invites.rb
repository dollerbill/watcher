# frozen_string_literal: true

class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.string :invite_email, null: false, index: true, unique: true
      t.string :invite_name, null: false

      t.references :invited_by_user, null: false
      t.references :group, null: false
      t.timestamps
      t.timestamp :accepted_at, index: true
    end
  end
end
