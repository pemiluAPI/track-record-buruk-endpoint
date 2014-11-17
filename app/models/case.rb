class Case < ActiveRecord::Base
  self.primary_key = "id"
  belongs_to :anggota, foreign_key: "anggota_id"
end
