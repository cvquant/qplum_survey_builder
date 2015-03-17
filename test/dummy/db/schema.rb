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

ActiveRecord::Schema.define(version: 20150316091329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "survey_builder_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "survey_response_id"
    t.json     "answer_data"
    t.integer  "time_to_answer"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "survey_builder_answers", ["question_id"], name: "index_survey_builder_answers_on_question_id", using: :btree
  add_index "survey_builder_answers", ["survey_response_id"], name: "index_survey_builder_answers_on_survey_response_id", using: :btree

  create_table "survey_builder_questions", force: :cascade do |t|
    t.integer  "survey_form_id"
    t.string   "name"
    t.text     "question_title"
    t.string   "type"
    t.json     "question_data"
    t.json     "answer_specs"
    t.integer  "position"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "survey_builder_questions", ["survey_form_id"], name: "index_survey_builder_questions_on_survey_form_id", using: :btree

  create_table "survey_builder_survey_forms", force: :cascade do |t|
    t.string   "name"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_builder_survey_responses", force: :cascade do |t|
    t.integer  "survey_form_id"
    t.integer  "user_id"
    t.integer  "time_to_answer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "survey_builder_survey_responses", ["survey_form_id"], name: "index_survey_builder_survey_responses_on_survey_form_id", using: :btree
  add_index "survey_builder_survey_responses", ["user_id"], name: "index_survey_builder_survey_responses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
