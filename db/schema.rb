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

ActiveRecord::Schema.define(version: 20_210_624_135_552) do
  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.integer 'record_id', null: false
    t.integer 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.integer 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'banners', force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'user_id', null: false
    t.integer 'category_id', null: false
    t.boolean 'closed', default: false, null: false
    t.boolean 'published', default: false, null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_banners_on_category_id'
    t.index ['user_id'], name: 'index_banners_on_user_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title'
    t.integer 'parent_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id', null: false
    t.index ['parent_id'], name: 'index_categories_on_parent_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id'
    t.integer 'parent_comment_id', null: false
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['parent_comment_id'], name: 'index_comments_on_parent_comment_id'
    t.index ['post_id'], name: 'index_comments_on_post_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id', null: false
    t.boolean 'published'
    t.integer 'category_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'survey_answers', force: :cascade do |t|
    t.string 'answer'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'survey_id', null: false
    t.integer 'votes', default: 0
    t.index ['survey_id'], name: 'index_survey_answers_on_survey_id'
  end

  create_table 'surveys', force: :cascade do |t|
    t.boolean 'published', default: false
    t.string 'question'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'closed', default: false
    t.date 'start_date'
    t.date 'end_date'
    t.integer 'user_id', default: 1, null: false
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'user_id'
    t.integer 'category_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_teams_on_category_id'
    t.index ['user_id'], name: 'index_teams_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'locked_at'
    t.string 'name'
    t.decimal 'failed_attempts'
    t.decimal 'role'
    t.string 'unlock_token'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'banners', 'categories'
  add_foreign_key 'banners', 'users'
  add_foreign_key 'categories', 'categories', column: 'parent_id'
  add_foreign_key 'comments', 'comments', column: 'parent_comment_id'
  add_foreign_key 'posts', 'categories'
  add_foreign_key 'posts', 'users'
  add_foreign_key 'survey_answers', 'surveys'
  add_foreign_key 'surveys', 'users'
end
