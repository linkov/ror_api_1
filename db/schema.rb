# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190412124130) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "art_categories", force: :cascade do |t|
    t.string   "picture",                limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "parent_art_category_id", limit: 4
  end

  add_index "art_categories", ["parent_art_category_id"], name: "index_art_categories_on_parent_art_category_id", using: :btree

  create_table "art_categories_users", id: false, force: :cascade do |t|
    t.integer "user_id",         limit: 4, null: false
    t.integer "art_category_id", limit: 4, null: false
  end

  create_table "art_categories_work_categories", id: false, force: :cascade do |t|
    t.integer "art_category_id",  limit: 4, null: false
    t.integer "work_category_id", limit: 4, null: false
  end

  create_table "art_categories_works", id: false, force: :cascade do |t|
    t.integer "art_category_id", limit: 4, null: false
    t.integer "work_id",         limit: 4, null: false
  end

  create_table "art_category_translations", force: :cascade do |t|
    t.integer  "art_category_id", limit: 4,   null: false
    t.string   "locale",          limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "title",           limit: 255
  end

  add_index "art_category_translations", ["art_category_id"], name: "index_art_category_translations_on_art_category_id", using: :btree
  add_index "art_category_translations", ["locale"], name: "index_art_category_translations_on_locale", using: :btree

  create_table "backrates", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "work_id",      limit: 4
    t.integer  "question_id",  limit: 4
    t.integer  "score",        limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "qualityscore", limit: 4
    t.integer  "rating_id",    limit: 4
  end

  add_index "backrates", ["question_id"], name: "index_backrates_on_question_id", using: :btree
  add_index "backrates", ["rating_id"], name: "index_backrates_on_rating_id", using: :btree
  add_index "backrates", ["user_id"], name: "index_backrates_on_user_id", using: :btree
  add_index "backrates", ["work_id"], name: "index_backrates_on_work_id", using: :btree

  create_table "bans", force: :cascade do |t|
    t.integer  "question_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "work_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "bans", ["question_id"], name: "index_bans_on_question_id", using: :btree
  add_index "bans", ["user_id"], name: "index_bans_on_user_id", using: :btree
  add_index "bans", ["work_id"], name: "index_bans_on_work_id", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_id",      limit: 4
    t.integer  "question_id",  limit: 4
  end

  add_index "conversations", ["question_id"], name: "index_conversations_on_question_id", using: :btree
  add_index "conversations", ["work_id"], name: "index_conversations_on_work_id", using: :btree

  create_table "expertises", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "expertises_users", id: false, force: :cascade do |t|
    t.integer "expertise_id", limit: 4, null: false
    t.integer "user_id",      limit: 4, null: false
  end

  create_table "focus", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "code",       limit: 255
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type", limit: 255
    t.integer  "impressionable_id",   limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "controller_name",     limit: 255
    t.string   "action_name",         limit: 255
    t.string   "view_name",           limit: 255
    t.string   "request_hash",        limit: 255
    t.string   "ip_address",          limit: 255
    t.string   "session_hash",        limit: 255
    t.text     "message",             limit: 65535
    t.text     "referrer",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "introtext_translations", force: :cascade do |t|
    t.integer  "introtext_id", limit: 4,     null: false
    t.string   "locale",       limit: 255,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "text",         limit: 65535
  end

  add_index "introtext_translations", ["introtext_id"], name: "index_introtext_translations_on_introtext_id", using: :btree
  add_index "introtext_translations", ["locale"], name: "index_introtext_translations_on_locale", using: :btree

  create_table "introtexts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manualflowpics", force: :cascade do |t|
    t.integer  "order",      limit: 4,   default: 0
    t.integer  "work_id",    limit: 4
    t.string   "url",        limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "height",     limit: 4
    t.integer  "width",      limit: 4
  end

  add_index "manualflowpics", ["work_id"], name: "index_manualflowpics_on_work_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body",            limit: 65535
    t.integer  "conversation_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.boolean  "read",            limit: 1,     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "packages", force: :cascade do |t|
    t.decimal  "price",                          precision: 8, scale: 2
    t.text     "description",      limit: 65535
    t.string   "image",            limit: 255
    t.string   "video",            limit: 255
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
    t.string   "title",            limit: 255
    t.string   "code",             limit: 255
    t.string   "author",           limit: 255
    t.boolean  "active",           limit: 1,                             default: false
    t.integer  "work_category_id", limit: 4
  end

  add_index "packages", ["work_category_id"], name: "index_packages_on_work_category_id", using: :btree

  create_table "packages_users", id: false, force: :cascade do |t|
    t.integer "user_id",    limit: 4, null: false
    t.integer "package_id", limit: 4, null: false
  end

  create_table "packages_works", id: false, force: :cascade do |t|
    t.integer "package_id", limit: 4, null: false
    t.integer "work_id",    limit: 4, null: false
  end

  add_index "packages_works", ["package_id", "work_id"], name: "index_packages_works_on_package_id_and_work_id", using: :btree

  create_table "parent_art_categories", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "order",      limit: 4
    t.string   "code",       limit: 255
  end

  create_table "parent_art_category_translations", force: :cascade do |t|
    t.integer  "parent_art_category_id", limit: 4,   null: false
    t.string   "locale",                 limit: 255, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "title",                  limit: 255
  end

  add_index "parent_art_category_translations", ["locale"], name: "index_parent_art_category_translations_on_locale", using: :btree
  add_index "parent_art_category_translations", ["parent_art_category_id"], name: "index_51214e9fb4ad34fb5e4948a4b79cf2710dc74485", using: :btree

  create_table "phrasings", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.integer  "order",      limit: 4
    t.integer  "work_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "pictures", ["work_id"], name: "index_pictures_on_work_id", using: :btree

  create_table "portfoliopics", force: :cascade do |t|
    t.string   "picture",    limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id",    limit: 4
    t.float    "width",      limit: 24
    t.float    "height",     limit: 24
    t.integer  "order",      limit: 4,   default: 0
  end

  add_index "portfoliopics", ["user_id"], name: "index_portfoliopics_on_user_id", using: :btree

  create_table "presentations", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "promo_message_translations", force: :cascade do |t|
    t.integer  "promo_message_id", limit: 4,     null: false
    t.string   "locale",           limit: 255,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "title",            limit: 65535
  end

  add_index "promo_message_translations", ["locale"], name: "index_promo_message_translations_on_locale", using: :btree
  add_index "promo_message_translations", ["promo_message_id"], name: "index_promo_message_translations_on_promo_message_id", using: :btree

  create_table "promo_messages", force: :cascade do |t|
    t.integer  "target_rate_count", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "promo_messages_users", id: false, force: :cascade do |t|
    t.integer "promo_message_id", limit: 4, null: false
    t.integer "user_id",          limit: 4, null: false
  end

  create_table "q_tutorial_translations", force: :cascade do |t|
    t.integer  "q_tutorial_id", limit: 4,     null: false
    t.string   "locale",        limit: 255,   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "title",         limit: 255
    t.text     "text",          limit: 65535
    t.string   "link",          limit: 255
  end

  add_index "q_tutorial_translations", ["locale"], name: "index_q_tutorial_translations_on_locale", using: :btree
  add_index "q_tutorial_translations", ["q_tutorial_id"], name: "index_q_tutorial_translations_on_q_tutorial_id", using: :btree

  create_table "q_tutorials", force: :cascade do |t|
    t.integer  "question_id",      limit: 4
    t.string   "link",             limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "proficiency_id",   limit: 4
    t.integer  "time",             limit: 4
    t.integer  "tutorial_type_id", limit: 4
    t.string   "placeholder",      limit: 255
    t.integer  "price",            limit: 4,   default: 0
  end

  add_index "q_tutorials", ["proficiency_id"], name: "index_q_tutorials_on_proficiency_id", using: :btree
  add_index "q_tutorials", ["question_id"], name: "index_q_tutorials_on_question_id", using: :btree
  add_index "q_tutorials", ["tutorial_type_id"], name: "index_q_tutorials_on_tutorial_type_id", using: :btree

  create_table "question_links", force: :cascade do |t|
    t.text     "url",         limit: 65535
    t.integer  "question_id", limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "offline",     limit: 1,     default: false
  end

  add_index "question_links", ["question_id"], name: "index_question_links_on_question_id", using: :btree

  create_table "question_tags", force: :cascade do |t|
    t.integer "art_category_id", limit: 4,             null: false
    t.integer "question_id",     limit: 4,             null: false
    t.integer "relevance",       limit: 4, default: 3
  end

  create_table "question_translations", force: :cascade do |t|
    t.integer  "question_id",        limit: 4,   null: false
    t.string   "locale",             limit: 255, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "title",              limit: 255
    t.string   "slider_wording_10",  limit: 255
    t.string   "slider_wording_20",  limit: 255
    t.string   "slider_wording_30",  limit: 255
    t.string   "slider_wording_40",  limit: 255
    t.string   "slider_wording_50",  limit: 255
    t.string   "slider_wording_60",  limit: 255
    t.string   "slider_wording_70",  limit: 255
    t.string   "slider_wording_80",  limit: 255
    t.string   "slider_wording_90",  limit: 255
    t.string   "slider_wording_100", limit: 255
    t.string   "low",                limit: 255
    t.string   "mid",                limit: 255
    t.string   "high",               limit: 255
  end

  add_index "question_translations", ["locale"], name: "index_question_translations_on_locale", using: :btree
  add_index "question_translations", ["question_id"], name: "index_question_translations_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "rating_type_id",           limit: 4
    t.integer  "rate_level_id",            limit: 4
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "slider_type_id",           limit: 4
    t.string   "video",                    limit: 255
    t.string   "placeholder",              limit: 255
    t.integer  "package_id",               limit: 4
    t.string   "ancestry",                 limit: 255
    t.integer  "position",                 limit: 4
    t.integer  "quality_limit",            limit: 4,     default: 25
    t.integer  "quality_limit_rate_count", limit: 4,     default: 50
    t.boolean  "active",                   limit: 1,     default: false
    t.integer  "phrasing_id",              limit: 4
    t.integer  "max_taggitator_words",     limit: 4,     default: 1
    t.boolean  "banned",                   limit: 1,     default: false
    t.text     "link",                     limit: 65535
    t.integer  "importance",               limit: 4,     default: 5
    t.integer  "user_id",                  limit: 4
    t.boolean  "manualflow",               limit: 1,     default: false
    t.boolean  "emocard",                  limit: 1,     default: false
    t.boolean  "requirecomment",           limit: 1,     default: false
  end

  add_index "questions", ["ancestry"], name: "index_questions_on_ancestry", using: :btree
  add_index "questions", ["package_id"], name: "index_questions_on_package_id", using: :btree
  add_index "questions", ["phrasing_id"], name: "index_questions_on_phrasing_id", using: :btree
  add_index "questions", ["rate_level_id"], name: "index_questions_on_rate_level_id", using: :btree
  add_index "questions", ["rating_type_id"], name: "index_questions_on_rating_type_id", using: :btree
  add_index "questions", ["slider_type_id"], name: "fk_rails_c4fb7b6c63", using: :btree
  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "questions_works", id: false, force: :cascade do |t|
    t.integer "work_id",     limit: 4, null: false
    t.integer "question_id", limit: 4, null: false
  end

  create_table "rate_levels", force: :cascade do |t|
    t.integer  "value",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "code",       limit: 255
  end

  create_table "rate_type_description_translations", force: :cascade do |t|
    t.integer  "rate_type_description_id", limit: 4,     null: false
    t.string   "locale",                   limit: 255,   null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.text     "description",              limit: 65535
  end

  add_index "rate_type_description_translations", ["locale"], name: "index_rate_type_description_translations_on_locale", using: :btree
  add_index "rate_type_description_translations", ["rate_type_description_id"], name: "index_bb270baa75bbd443782b6a10e68a413afa59bf0d", using: :btree

  create_table "rate_type_descriptions", force: :cascade do |t|
    t.integer  "rating_type_id", limit: 4
    t.integer  "focu_id",        limit: 4
    t.integer  "rate_level_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "rate_type_descriptions", ["focu_id"], name: "index_rate_type_descriptions_on_focu_id", using: :btree
  add_index "rate_type_descriptions", ["rate_level_id"], name: "index_rate_type_descriptions_on_rate_level_id", using: :btree
  add_index "rate_type_descriptions", ["rating_type_id"], name: "index_rate_type_descriptions_on_rating_type_id", using: :btree

  create_table "ratecolors", force: :cascade do |t|
    t.integer "rating", limit: 4
    t.integer "red",    limit: 4
    t.integer "green",  limit: 4
  end

  create_table "rating_type_translations", force: :cascade do |t|
    t.integer  "rating_type_id", limit: 4,   null: false
    t.string   "locale",         limit: 255, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name",           limit: 255
  end

  add_index "rating_type_translations", ["locale"], name: "index_rating_type_translations_on_locale", using: :btree
  add_index "rating_type_translations", ["rating_type_id"], name: "index_rating_type_translations_on_rating_type_id", using: :btree

  create_table "rating_types", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "focu_id",          limit: 4
    t.integer  "parent_id",        limit: 4
    t.string   "ancestry",         limit: 255
    t.integer  "position",         limit: 4
    t.string   "code",             limit: 255
    t.integer  "priority",         limit: 4
    t.integer  "limit",            limit: 4
    t.integer  "limit_rate_count", limit: 4
    t.integer  "package_id",       limit: 4
  end

  add_index "rating_types", ["ancestry"], name: "index_rating_types_on_ancestry", using: :btree
  add_index "rating_types", ["focu_id"], name: "index_rating_types_on_focu_id", using: :btree
  add_index "rating_types", ["package_id"], name: "index_rating_types_on_package_id", using: :btree

  create_table "rating_types_work_categories", id: false, force: :cascade do |t|
    t.integer "rating_type_id",   limit: 4, null: false
    t.integer "work_category_id", limit: 4, null: false
  end

  add_index "rating_types_work_categories", ["rating_type_id", "work_category_id"], name: "rating_wcat_index", unique: true, using: :btree
  add_index "rating_types_work_categories", ["work_category_id", "rating_type_id"], name: "wcat_rating_index", unique: true, using: :btree

  create_table "rating_types_works", id: false, force: :cascade do |t|
    t.integer "work_id",        limit: 4, null: false
    t.integer "rating_type_id", limit: 4, null: false
  end

  add_index "rating_types_works", ["rating_type_id", "work_id"], name: "index_rating_types_works_on_rating_type_id_and_work_id", using: :btree
  add_index "rating_types_works", ["work_id", "rating_type_id"], name: "index_rating_types_works_on_work_id_and_rating_type_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "score",                     limit: 4
    t.integer  "work_id",                   limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "author_id",                 limit: 4
    t.integer  "question_id",               limit: 4
    t.integer  "suggestion_choice_id",      limit: 4
    t.integer  "suggestion_word_choice_id", limit: 4
    t.integer  "emocode",                   limit: 4,     default: 0
    t.text     "comment",                   limit: 65535
  end

  add_index "ratings", ["author_id"], name: "index_ratings_on_author_id", using: :btree
  add_index "ratings", ["question_id"], name: "index_ratings_on_question_id", using: :btree
  add_index "ratings", ["suggestion_choice_id"], name: "index_ratings_on_suggestion_choice_id", using: :btree
  add_index "ratings", ["suggestion_word_choice_id"], name: "index_ratings_on_suggestion_word_choice_id", using: :btree
  add_index "ratings", ["work_id"], name: "index_ratings_on_work_id", using: :btree

  create_table "reviewpayments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.float    "amount",     limit: 24
    t.integer  "work_id",    limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "reviewpayments", ["user_id"], name: "index_reviewpayments_on_user_id", using: :btree
  add_index "reviewpayments", ["work_id"], name: "index_reviewpayments_on_work_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.integer  "value",      limit: 4
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "slider_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "suggestion_choices", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "work_id",       limit: 4
    t.integer  "suggestion_id", limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "question_id",   limit: 4
    t.boolean  "positive",      limit: 1, default: false
  end

  add_index "suggestion_choices", ["question_id"], name: "fk_rails_0052223f72", using: :btree
  add_index "suggestion_choices", ["suggestion_id"], name: "index_suggestion_choices_on_suggestion_id", using: :btree
  add_index "suggestion_choices", ["user_id"], name: "index_suggestion_choices_on_user_id", using: :btree
  add_index "suggestion_choices", ["work_id"], name: "index_suggestion_choices_on_work_id", using: :btree

  create_table "suggestion_translations", force: :cascade do |t|
    t.integer  "suggestion_id", limit: 4,   null: false
    t.string   "locale",        limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "title",         limit: 255
  end

  add_index "suggestion_translations", ["locale"], name: "index_suggestion_translations_on_locale", using: :btree
  add_index "suggestion_translations", ["suggestion_id"], name: "index_suggestion_translations_on_suggestion_id", using: :btree

  create_table "suggestion_word_black_list_items", force: :cascade do |t|
    t.string   "word",        limit: 255
    t.integer  "question_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "suggestion_word_black_list_items", ["question_id"], name: "index_suggestion_word_black_list_items_on_question_id", using: :btree

  create_table "suggestion_word_choice_counts", force: :cascade do |t|
    t.integer  "suggestion_word_id", limit: 4
    t.integer  "question_id",        limit: 4
    t.integer  "work_id",            limit: 4
    t.integer  "count",              limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "suggestion_word_choice_counts", ["question_id"], name: "index_suggestion_word_choice_counts_on_question_id", using: :btree
  add_index "suggestion_word_choice_counts", ["suggestion_word_id"], name: "index_suggestion_word_choice_counts_on_suggestion_word_id", using: :btree
  add_index "suggestion_word_choice_counts", ["work_id"], name: "index_suggestion_word_choice_counts_on_work_id", using: :btree

  create_table "suggestion_word_choices", force: :cascade do |t|
    t.integer  "suggestion_word_id", limit: 4
    t.integer  "user_id",            limit: 4
    t.integer  "work_id",            limit: 4
    t.integer  "question_id",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "suggestion_word_choices", ["question_id"], name: "index_suggestion_word_choices_on_question_id", using: :btree
  add_index "suggestion_word_choices", ["suggestion_word_id"], name: "index_suggestion_word_choices_on_suggestion_word_id", using: :btree
  add_index "suggestion_word_choices", ["user_id"], name: "index_suggestion_word_choices_on_user_id", using: :btree
  add_index "suggestion_word_choices", ["work_id"], name: "index_suggestion_word_choices_on_work_id", using: :btree

  create_table "suggestion_words", force: :cascade do |t|
    t.string   "word",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "suggestions", force: :cascade do |t|
    t.integer  "question_id",     limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "negative_impact", limit: 4, default: 0
  end

  add_index "suggestions", ["question_id"], name: "index_suggestions_on_question_id", using: :btree

  create_table "testawork_choices", force: :cascade do |t|
    t.integer  "picture_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "work_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "testawork_choices", ["picture_id"], name: "index_testawork_choices_on_picture_id", using: :btree
  add_index "testawork_choices", ["user_id"], name: "index_testawork_choices_on_user_id", using: :btree
  add_index "testawork_choices", ["work_id"], name: "index_testawork_choices_on_work_id", using: :btree

  create_table "tutorial_step_translations", force: :cascade do |t|
    t.integer  "tutorial_step_id", limit: 4,     null: false
    t.string   "locale",           limit: 255,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "text",             limit: 65535
  end

  add_index "tutorial_step_translations", ["locale"], name: "index_tutorial_step_translations_on_locale", using: :btree
  add_index "tutorial_step_translations", ["tutorial_step_id"], name: "index_tutorial_step_translations_on_tutorial_step_id", using: :btree

  create_table "tutorial_steps", force: :cascade do |t|
    t.integer  "tutorial_id", limit: 4
    t.string   "image",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "order",       limit: 4
    t.string   "video",       limit: 255
  end

  create_table "tutorial_types", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "icon",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tutorials", force: :cascade do |t|
    t.integer  "rating_type_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255
    t.string   "password",               limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "surname",                limit: 255
    t.string   "picture",                limit: 255
    t.text     "about",                  limit: 65535
    t.string   "country",                limit: 255
    t.string   "city",                   limit: 255
    t.string   "zip",                    limit: 255
    t.string   "encrypted_password",     limit: 255,   default: "",      null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "nickname",               limit: 255
    t.string   "provider",               limit: 255,   default: "email", null: false
    t.string   "uid",                    limit: 255,   default: "",      null: false
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.text     "tokens",                 limit: 65535
    t.string   "locale",                 limit: 255
    t.boolean  "guest",                  limit: 1
    t.string   "temp_uid",               limit: 255
    t.boolean  "allow_messaging",        limit: 1,     default: true
    t.boolean  "onboarding",             limit: 1,     default: false
    t.boolean  "flexadmin",              limit: 1,     default: false
    t.boolean  "manualflow",             limit: 1,     default: false
    t.boolean  "flexreview",             limit: 1,     default: false
    t.string   "website",                limit: 255
    t.string   "sharepic",               limit: 255
    t.text     "shortbio",               limit: 65535
    t.string   "expertemail",            limit: 255
    t.string   "tagline",                limit: 255
    t.boolean  "freereview",             limit: 1,     default: false
    t.float    "price",                  limit: 24,    default: 19.99
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "users_webnotificationflows", id: false, force: :cascade do |t|
    t.integer "user_id",                limit: 4, null: false
    t.integer "webnotificationflow_id", limit: 4, null: false
  end

  create_table "webnotification_translations", force: :cascade do |t|
    t.integer  "webnotification_id", limit: 4,     null: false
    t.string   "locale",             limit: 255,   null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "title",              limit: 255
    t.text     "detail",             limit: 65535
  end

  add_index "webnotification_translations", ["locale"], name: "index_webnotification_translations_on_locale", using: :btree
  add_index "webnotification_translations", ["webnotification_id"], name: "index_webnotification_translations_on_webnotification_id", using: :btree

  create_table "webnotificationflows", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "route",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "webnotifications", force: :cascade do |t|
    t.string   "image",                  limit: 255
    t.integer  "webnotificationflow_id", limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "order",                  limit: 4,   default: 0
  end

  add_index "webnotifications", ["webnotificationflow_id"], name: "index_webnotifications_on_webnotificationflow_id", using: :btree

  create_table "work_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "works", force: :cascade do |t|
    t.string   "title",                   limit: 255
    t.text     "description",             limit: 65535
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "url",                     limit: 255
    t.integer  "user_id",                 limit: 4
    t.string   "picture",                 limit: 255
    t.integer  "work_category_id",        limit: 4
    t.boolean  "is_active",               limit: 1,     default: false
    t.boolean  "is_visible",              limit: 1,     default: true
    t.integer  "focus_id",                limit: 4
    t.integer  "focu_id",                 limit: 4
    t.integer  "emo_point",               limit: 4
    t.integer  "idea_point",              limit: 4
    t.integer  "tech_point",              limit: 4
    t.string   "picture_tmp",             limit: 255
    t.text     "pics",                    limit: 65535
    t.text     "pictures",                limit: 65535
    t.integer  "pictures_count",          limit: 4,     default: 0,     null: false
    t.integer  "cover_id",                limit: 4
    t.integer  "average_rating",          limit: 4,     default: 50
    t.integer  "presentation_id",         limit: 4
    t.boolean  "testing",                 limit: 1,     default: false
    t.boolean  "userpack",                limit: 1,     default: false
    t.boolean  "sharedpack",              limit: 1,     default: true
    t.string   "audio",                   limit: 255
    t.string   "wavescreenshot",          limit: 255
    t.boolean  "onboarding",              limit: 1,     default: false
    t.boolean  "public",                  limit: 1,     default: false
    t.boolean  "norates",                 limit: 1,     default: true
    t.boolean  "manualflow",              limit: 1,     default: false
    t.string   "manualflowpic",           limit: 255
    t.boolean  "reviewmailed",            limit: 1,     default: false
    t.boolean  "expertrated",             limit: 1,     default: false
    t.string   "reviewlang",              limit: 255
    t.text     "presenterquestion",       limit: 65535
    t.text     "presenterquestionanswer", limit: 65535
    t.integer  "presentationwidth",       limit: 4
    t.integer  "presentationheight",      limit: 4
    t.text     "worklink",                limit: 65535
    t.text     "expertcomment",           limit: 65535
    t.integer  "reviewratebackscore",     limit: 4
    t.text     "reviewratebackcomment",   limit: 65535
    t.boolean  "betatest",                limit: 1,     default: false
  end

  add_index "works", ["focu_id"], name: "index_works_on_focu_id", using: :btree
  add_index "works", ["focus_id"], name: "index_works_on_focus_id", using: :btree
  add_index "works", ["presentation_id"], name: "index_works_on_presentation_id", using: :btree
  add_index "works", ["user_id", "created_at"], name: "index_works_on_user_id_and_created_at", using: :btree
  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree
  add_index "works", ["work_category_id"], name: "index_works_on_work_category_id", using: :btree

  add_foreign_key "art_categories", "parent_art_categories"
  add_foreign_key "backrates", "questions"
  add_foreign_key "backrates", "ratings"
  add_foreign_key "backrates", "users"
  add_foreign_key "backrates", "works"
  add_foreign_key "bans", "questions"
  add_foreign_key "bans", "users"
  add_foreign_key "bans", "works"
  add_foreign_key "conversations", "questions"
  add_foreign_key "conversations", "works"
  add_foreign_key "manualflowpics", "works"
  add_foreign_key "packages", "work_categories"
  add_foreign_key "pictures", "works"
  add_foreign_key "portfoliopics", "users"
  add_foreign_key "q_tutorials", "proficiencies"
  add_foreign_key "q_tutorials", "questions"
  add_foreign_key "q_tutorials", "tutorial_types"
  add_foreign_key "question_links", "questions"
  add_foreign_key "questions", "packages"
  add_foreign_key "questions", "phrasings"
  add_foreign_key "questions", "rate_levels"
  add_foreign_key "questions", "rating_types"
  add_foreign_key "questions", "slider_types"
  add_foreign_key "questions", "users"
  add_foreign_key "rate_type_descriptions", "focus"
  add_foreign_key "rate_type_descriptions", "rate_levels"
  add_foreign_key "rate_type_descriptions", "rating_types"
  add_foreign_key "rating_types", "focus"
  add_foreign_key "rating_types", "packages"
  add_foreign_key "ratings", "questions"
  add_foreign_key "ratings", "suggestion_choices"
  add_foreign_key "ratings", "suggestion_word_choices"
  add_foreign_key "ratings", "users", column: "author_id"
  add_foreign_key "ratings", "works"
  add_foreign_key "reviewpayments", "users"
  add_foreign_key "reviewpayments", "works"
  add_foreign_key "suggestion_choices", "questions"
  add_foreign_key "suggestion_choices", "suggestions"
  add_foreign_key "suggestion_choices", "users"
  add_foreign_key "suggestion_choices", "works"
  add_foreign_key "suggestion_word_black_list_items", "questions"
  add_foreign_key "suggestion_word_choice_counts", "questions"
  add_foreign_key "suggestion_word_choice_counts", "suggestion_words"
  add_foreign_key "suggestion_word_choice_counts", "works"
  add_foreign_key "suggestion_word_choices", "questions"
  add_foreign_key "suggestion_word_choices", "suggestion_words"
  add_foreign_key "suggestion_word_choices", "users"
  add_foreign_key "suggestion_word_choices", "works"
  add_foreign_key "suggestions", "questions"
  add_foreign_key "testawork_choices", "pictures"
  add_foreign_key "testawork_choices", "users"
  add_foreign_key "testawork_choices", "works"
  add_foreign_key "webnotifications", "webnotificationflows"
  add_foreign_key "works", "focus"
  add_foreign_key "works", "presentations"
  add_foreign_key "works", "users"
  add_foreign_key "works", "work_categories"
end
