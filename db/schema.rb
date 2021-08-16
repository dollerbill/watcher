# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_807_210_901) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'citext'
  enable_extension 'plpgsql'

  create_table 'groups', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'invites', force: :cascade do |t|
    t.string 'invite_name', null: false
    t.citext 'invite_email', null: false
    t.string 'token'
    t.bigint 'invited_by_user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'accepted_at'
    t.datetime 'token_expires_at', null: false
    t.index ['accepted_at'], name: 'index_invites_on_accepted_at'
    t.index ['invite_email'], name: 'index_invites_on_invite_email', unique: true
    t.index ['invited_by_user_id'], name: 'index_invites_on_invited_by_user_id'
    t.index ['token'], name: 'index_invites_on_token', unique: true
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'streaming_services', null: false, array: true
    t.integer 'length', null: false
    t.string 'image_url'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'imdb_id'
  end

  create_table 'user_reactions', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.bigint 'user_id', null: false
    t.integer 'reaction', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['movie_id'], name: 'index_user_reactions_on_movie_id'
    t.index ['reaction'], name: 'index_user_reactions_on_reaction'
    t.index ['user_id'], name: 'index_user_reactions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'name', null: false
    t.string 'encrypted_password', limit: 128, null: false
    t.string 'confirmation_token', limit: 128
    t.string 'remember_token', limit: 128, null: false
    t.string 'streaming_services', default: [], null: false, array: true
    t.bigint 'group_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['group_id'], name: 'index_users_on_group_id'
    t.index ['remember_token'], name: 'index_users_on_remember_token'
  end
end
