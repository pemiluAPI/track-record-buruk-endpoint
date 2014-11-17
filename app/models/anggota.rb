class Anggota < ActiveRecord::Base
  has_many :cases, :foreign_key => 'anggota_id'
end
