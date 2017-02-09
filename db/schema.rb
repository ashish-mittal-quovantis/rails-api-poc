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

ActiveRecord::Schema.define(version: 20170209060557) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.string   "action"
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["trackable_id"], name: "index_activities_on_trackable_id", using: :btree
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "announcement_receivers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "announcement_id"
    t.integer  "receiver_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["announcement_id"], name: "index_announcement_receivers_on_announcement_id", using: :btree
    t.index ["receiver_id"], name: "index_announcement_receivers_on_receiver_id", using: :btree
  end

  create_table "announcements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "message",                 limit: 65535
    t.integer  "receiver_id"
    t.integer  "giver_id"
    t.integer  "organization_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "cached_votes_total",                    default: 0
    t.integer  "cached_votes_score",                    default: 0
    t.integer  "cached_votes_up",                       default: 0
    t.integer  "cached_votes_down",                     default: 0
    t.integer  "cached_weighted_score",                 default: 0
    t.integer  "cached_weighted_total",                 default: 0
    t.float    "cached_weighted_average", limit: 24,    default: 0.0
    t.integer  "shared_with"
    t.string   "type"
    t.index ["cached_votes_down"], name: "index_appreciations_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_appreciations_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_appreciations_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_appreciations_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_appreciations_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_appreciations_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_appreciations_on_cached_weighted_total", using: :btree
  end

  create_table "client_feedbacks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email"
    t.string   "experience"
    t.text     "comment",                    limit: 65535
    t.integer  "feedback_request_detail_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "commentable_id",                 default: 0
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body",             limit: 65535
    t.string   "subject"
    t.integer  "user_id",                        default: 0, null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "competencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "organization_id"
    t.float    "organization_bar",     limit: 24,    default: 3.5
    t.text     "description",          limit: 65535
    t.integer  "questions_count",                    default: 0
    t.boolean  "is_deleted",                         default: false
    t.integer  "source_competency_id"
  end

  create_table "competencies_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "competency_id"
    t.integer  "question_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["competency_id", "question_id"], name: "index_competencies_questions_on_competency_id_and_question_id", using: :btree
    t.index ["competency_id"], name: "index_competencies_questions_on_competency_id", using: :btree
    t.index ["question_id"], name: "index_competencies_questions_on_question_id", using: :btree
  end

  create_table "competencies_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "competency_id"
    t.integer "template_id"
    t.index ["competency_id"], name: "index_competencies_templates_on_competency_id", using: :btree
    t.index ["template_id", "competency_id"], name: "index_competencies_templates_on_template_id_and_competency_id", using: :btree
    t.index ["template_id"], name: "index_competencies_templates_on_template_id", using: :btree
  end

  create_table "content_in_line_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "custom_one_on_one_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "one_on_one_questionnaire_id"
    t.text     "question_text",               limit: 65535
    t.string   "response_type"
    t.integer  "one_on_one_child_event_id"
    t.string   "created_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["one_on_one_child_event_id"], name: "index_custom_one_on_one_questions_on_one_on_one_child_event_id", using: :btree
    t.index ["one_on_one_questionnaire_id"], name: "index_custom_one_on_one_questions_on_one_on_one_questionnaire_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "priority",                 default: 0
    t.integer  "attempts",                 default: 0
    t.text     "handler",    limit: 65535
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "feedback_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "feedback_request_id"
    t.text     "instance",            limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "feedback_request_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "status",               default: "pending"
    t.integer  "feedback_to"
    t.integer  "feedback_request_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "anonymous",            default: false
    t.integer  "feedback_instance_id"
    t.string   "external_email"
  end

  create_table "feedback_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title"
    t.integer  "initiated_by"
    t.integer  "feedback_for"
    t.date     "due_date"
    t.integer  "template_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.date     "extended_date"
    t.string   "request_type",  default: "Review"
    t.datetime "date_held_on"
    t.index ["template_id"], name: "index_feedback_requests_on_template_id", using: :btree
  end

  create_table "feedback_response_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "feedback_request_id"
    t.integer  "question_id"
    t.float    "average",             limit: 24, default: 0.0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "reviewee_rating",                default: 0
    t.float    "peer_average",        limit: 24, default: 0.0
    t.float    "subordinate_average", limit: 24, default: 0.0
    t.float    "leader_average",      limit: 24, default: 0.0
    t.integer  "competency_id"
    t.float    "client_average",      limit: 24, default: 0.0
    t.index ["feedback_request_id", "question_id"], name: "responses_scores_request_question", using: :btree
    t.index ["feedback_request_id"], name: "index_feedback_response_scores_on_feedback_request_id", using: :btree
    t.index ["question_id"], name: "index_feedback_response_scores_on_question_id", using: :btree
  end

  create_table "feedback_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "question_id"
    t.integer  "response_option_id"
    t.integer  "competency_id"
    t.text     "question_comment",           limit: 65535
    t.integer  "feedback_request_detail_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "follow_ups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "follow_up_text",            limit: 65535
    t.text     "status",                    limit: 65535
    t.boolean  "isHighlighted"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "one_on_one_child_event_id"
  end

  create_table "goal_key_result_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "goal_id"
    t.integer  "key_result_area_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "goals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "objective",          limit: 65535
    t.text     "description",        limit: 65535
    t.datetime "due_date"
    t.integer  "assignor_id"
    t.decimal  "completion",                       precision: 10
    t.integer  "status"
    t.decimal  "weightage",                        precision: 10
    t.integer  "parent_id"
    t.integer  "organization_id"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.integer  "assignee_id"
    t.integer  "key_result_area_id"
    t.boolean  "sample",                                          default: false
  end

  create_table "group_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",     limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "organization_id"
  end

  create_table "innovations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "content",                 limit: 65535
    t.string   "title"
    t.integer  "giver_id"
    t.integer  "organization_id"
    t.integer  "cached_votes_total"
    t.integer  "cached_votes_score"
    t.integer  "cached_votes_up"
    t.integer  "cached_votes_down"
    t.integer  "cached_weighted_score"
    t.integer  "cached_weighted_total"
    t.float    "cached_weighted_average", limit: 24
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "key_result_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "title",      limit: 65535
    t.text     "desciption", limit: 65535
    t.decimal  "weightage",                precision: 10
    t.datetime "due_date"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "completion",                              default: 0
    t.integer  "goal_id"
  end

  create_table "lead_avg_reminders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "month_year"
    t.integer  "lead_id"
    t.string   "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "note_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "comment_text"
    t.integer  "one_on_one_note_id"
    t.integer  "commenter_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "one_on_one_child_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "one_on_one_parent_event_id"
    t.date     "scheduled_on"
    t.string   "meeting_status",             default: "To Occur"
    t.boolean  "rescheduled",                default: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.datetime "starts"
    t.datetime "rescheduled_starts"
    t.date     "rescheduled_date"
    t.datetime "until"
    t.datetime "rescheduled_until"
    t.date     "sent_instant_reminder_on"
    t.boolean  "is_freezed",                 default: false
    t.boolean  "is_lead_published",          default: false
    t.boolean  "is_member_published",        default: false
    t.date     "member_published_on"
    t.integer  "lead_id"
    t.boolean  "counted_in_avg_reminder",    default: false
    t.date     "due_date"
    t.integer  "user_id"
    t.datetime "nudge_time",                 default: '2016-07-29 05:47:44'
    t.index ["one_on_one_parent_event_id"], name: "index_oneonone_childevents_on_oneonone_parentevent_id", using: :btree
  end

  create_table "one_on_one_notes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "one_on_one_child_event_id"
    t.text     "comment_text",              limit: 65535
    t.string   "follow_up_note"
    t.boolean  "isHighlighted",                           default: false
    t.boolean  "isRemoved",                               default: false
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.integer  "one_on_one_question_id"
    t.string   "follow_up_status",                        default: "Not initiated"
    t.integer  "user_id"
    t.string   "addable_question_type"
    t.integer  "addable_question_id"
    t.index ["one_on_one_child_event_id"], name: "index_oneonone_event_comments_on_oneonone_childevent_id", using: :btree
  end

  create_table "one_on_one_parent_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "lead_id"
    t.date     "started_on"
    t.string   "recurrence"
    t.string   "day_of_week"
    t.boolean  "send_reminder",     default: false
    t.string   "accepted_by_user",  default: "0"
    t.string   "recurrence_status", default: "Active"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "starts"
    t.string   "until"
    t.date     "end_date"
    t.date     "next_event_date"
    t.integer  "color_code",        default: 0
    t.date     "due_date"
    t.index ["lead_id"], name: "index_oneonone_parentevents_on_lead_id", using: :btree
    t.index ["user_id"], name: "index_oneonone_parentevents_on_user_id", using: :btree
  end

  create_table "one_on_one_questionnaires", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "organization_id"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "one_on_one_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "one_on_one_questionnaire_id"
    t.text     "question_text",               limit: 65535
    t.string   "response_type",                             default: "Text"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "question_type"
    t.boolean  "is_active",                                 default: true
    t.index ["question_type"], name: "index_one_on_one_questions_on_question_type", using: :btree
    t.index ["question_type"], name: "index_one_on_one_questions_on_type", using: :btree
  end

  create_table "org_avg_reminders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "month_year"
    t.integer  "org_id"
    t.string   "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "domain"
    t.string   "display_name"
    t.string   "sub_domain"
    t.string   "account_type",             default: "Free"
    t.date     "subscription_end_date"
    t.boolean  "isActive",                 default: true
    t.string   "payment_type"
    t.integer  "allowed_users",            default: 5
    t.string   "deactivate_comment"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "keep_reviews_transparent", default: false
  end

  create_table "organizations_payment_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "payment_detail_id"
    t.integer "organization_id"
  end

  create_table "payment_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "paypal_id"
    t.integer  "amount"
    t.string   "currency"
    t.string   "transaction_id"
    t.string   "status"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.float    "rate",            limit: 24, default: 4.0
    t.integer  "organization_id"
    t.index ["organization_id"], name: "index_payment_details_on_organization_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "amount"
    t.date     "recurred_on"
    t.string   "message"
    t.string   "error_desc"
    t.integer  "payment_detail_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.text     "content",                 limit: 65535
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "cached_votes_total",                    default: 0
    t.integer  "cached_votes_score",                    default: 0
    t.integer  "cached_votes_up",                       default: 0
    t.integer  "cached_votes_down",                     default: 0
    t.integer  "cached_weighted_score",                 default: 0
    t.integer  "cached_weighted_total",                 default: 0
    t.float    "cached_weighted_average", limit: 24,    default: 0.0
    t.index ["cached_votes_down"], name: "index_posts_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_posts_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_posts_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_posts_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_posts_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_posts_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_posts_on_cached_weighted_total", using: :btree
    t.index ["organization_id"], name: "index_posts_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "description",      limit: 65535
    t.integer  "response_type_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "is_deleted",                     default: false
    t.text     "help_text",        limit: 65535
  end

  create_table "questions_templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "template_id"
    t.integer "question_id"
  end

  create_table "response_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "value"
    t.string   "description"
    t.integer  "response_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "response_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "roles_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "team_avg_reminders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "month_year"
    t.integer  "team_id"
    t.string   "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "team_id"
    t.integer  "member_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "approved",   default: false
  end

  create_table "team_talks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["team_id"], name: "index_team_talks_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_talks_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",     limit: 65535
    t.integer  "lead"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "organization_id"
    t.string   "recurrence"
  end

  create_table "templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "organization_id"
    t.integer  "competencies_count", default: 0
    t.boolean  "is_deleted",         default: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "organization_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "name"
    t.boolean  "admin",                                default: false
    t.string   "invitation_token",       limit: 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "title"
    t.string   "ancestry"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
    t.text     "about_me",               limit: 65535
    t.boolean  "approved",                             default: false
    t.string   "mobile_no"
    t.string   "extn"
    t.string   "phone_no"
    t.boolean  "terms_and_conditions",                 default: false
    t.integer  "nudge_frequency",                      default: 24
    t.boolean  "is_active",                            default: true
    t.text     "tokens",                 limit: 65535
    t.index ["ancestry"], name: "index_users_on_ancestry", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["votable_id", "votable_type"], name: "index_votes_on_votable_id_and_votable_type", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type"], name: "index_votes_on_voter_id_and_voter_type", using: :btree
  end

end
