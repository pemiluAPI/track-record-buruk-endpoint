class CreateBadRecords < ActiveRecord::Migration
  def change
    create_table :bad_records do |t|
      t.string      :nama_fraksi
      t.integer    :jumlah
      t.integer    :terdakwa
      t.integer    :tersangka
      t.integer    :terperiksa
      t.integer    :pengacara
      t.integer    :diduga
      t.integer    :ham
      t.integer    :pidana
      t.integer    :pemilu
      t.integer    :etik
      t.integer    :absen
    end
  end
end
