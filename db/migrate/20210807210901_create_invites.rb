# frozen_string_literal: true

class CreateInvites < ActiveRecord::Migration[6.1]
  enable_extension :citext

  def change
    create_table :invites do |t|
      t.string :invite_name, null: false
      t.citext :invite_email, null: false, index: { unique: true }
      t.string :token, index: { unique: true }
      t.references :invited_by_user, null: false
      t.timestamps
      t.timestamp :accepted_at, index: true
      t.timestamp :token_expires_at, null: false
    end
  end
end
