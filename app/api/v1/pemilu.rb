module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :tabulasi do
      desc "Return ALL Track Record Buruk"
      get do
        records = Array.new

        valid_params = {
          fraksi: 'nama_fraksi'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        BadRecord.where(conditions)
          .each do |record|
            records << {
              id: record.id,
              fraksi: record.nama_fraksi,
              jumlah: record.jumlah,
              korupsi: {
                terdakwa: record.terdakwa,
                tersangka: record.tersangka,
                terperiksa: record.terperiksa,
                pengacara: record.pengacara,
                diduga: record.diduga
              },
              kumham: {
                ham: record.ham,
                pidana: record.pidana,
                pemilu: record.pemilu
              },
              internal: {
                etik: record.etik,
                absen: record.absen
              }
            }
          end

        {
          results: {
            count: records.count,
            tabulasi: records
          }
        }
      end
    end

    resource  :kasus_anggota do
      desc "Return ALL  Anggota dengan kasusnya"

      get do
        member = Array.new

         valid_params = {
          partai: 'partai',
          dapil: 'id_dapil'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        Anggota.includes(:cases)
          .where(conditions)
          .each do |anggota|
            member << {
              id: anggota.id,
              partai: anggota.partai,
              dapil: {
                id: anggota.id_dapil,
                nama: anggota.nama_dapil
              },
              nama: anggota.nama,
              kasus: anggota.cases.select(:id, :description)
            }
          end

        {
          results: {
            count: member.count,
            anggota: member
          }
        }
      end
    end
  end
end