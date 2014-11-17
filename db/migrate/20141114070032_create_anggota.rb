class CreateAnggota < ActiveRecord::Migration
  def change
    create_table :anggota do |t|
      t.integer :id_partai
      t.string  :partai
      t.string  :id_dapil
      t.string  :nama_dapil
      t.string  :nama
    end
  end
end
