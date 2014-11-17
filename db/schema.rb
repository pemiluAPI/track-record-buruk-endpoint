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

ActiveRecord::Schema.define(version: 20141114073657) do

  create_table "anggota", force: true do |t|
    t.integer "id_partai"
    t.string  "partai"
    t.string  "id_dapil"
    t.string  "nama_dapil"
    t.string  "nama"
  end

  create_table "bad_records", force: true do |t|
    t.string  "nama_fraksi"
    t.integer "jumlah"
    t.integer "terdakwa"
    t.integer "tersangka"
    t.integer "terperiksa"
    t.integer "pengacara"
    t.integer "diduga"
    t.integer "ham"
    t.integer "pidana"
    t.integer "pemilu"
    t.integer "etik"
    t.integer "absen"
  end

  create_table "cases", force: true do |t|
    t.text    "description"
    t.integer "anggota_id"
  end

  add_index "cases", ["anggota_id"], name: "index_cases_on_anggota_id", using: :btree

end
