class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.text  :description
      t.integer :anggota_id
    end
    add_index :cases, :anggota_id
  end
end
