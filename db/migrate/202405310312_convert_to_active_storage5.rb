class ConvertToActiveStorage5 < ActiveRecord::Migration[5.2]
  require 'net/http'
  require 'open-uri'

  def up
    connection = ActiveRecord::Base.connection.raw_connection

    transaction do


      Collection.find_each.each do |instance|
        next if instance.send("icon_file_name").blank?
            ActiveRecord::Base.connection.execute(%Q(
              INSERT INTO active_storage_blobs (
                `key`, `filename`, `content_type`, `metadata`, `byte_size`, `checksum`, `created_at`, `service_name`
              ) VALUES (
                '#{SecureRandom.uuid}',
                '#{instance.send("icon_file_name")}',
                '#{instance.send("icon_content_type")}', 
                '{}',
                '#{instance.send("icon_file_size")}',
                '0',
                '#{instance.updated_at.iso8601}',
                'production'
              )
            ))

            ActiveRecord::Base.connection.execute(%Q(
              INSERT INTO active_storage_attachments (
                name, record_type, record_id, blob_id, created_at
              ) VALUES (
                'icon',
                'pseud',
                #{instance.id},
                LAST_INSERT_ID(),
                '#{instance.updated_at.iso8601}'
              )
            ))
          end
        end
      end
end
