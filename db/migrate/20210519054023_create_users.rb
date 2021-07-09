# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
      t.string :streaming_services, array: true, null: false, default: []
      # t.string :partner_email, null: false
      t.references :group
      # t.references :user, :partner_user_id
    end

    add_index :users, :email
    add_index :users, :remember_token
    # add_index :users, :partner_email
  end
end
