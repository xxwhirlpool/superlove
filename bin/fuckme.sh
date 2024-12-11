#!bin/rails runner
connection = ActiveRecord::Base.connection.raw_connection

def perform
    connection = ActiveRecord::Base.connection.raw_connection

    Pseud.find_each.each do |instance|
        next if instance.send("icon_file_name").blank?
        
    model.where.not("#{attachment}_file_name": nil).find_each do |instance|
      bucket = ENV['AWS_BUCKET']
      name = instance.send("#{attachment}_file_name")
      content_type = instance.send("#{attachment}_content_type")
      id = instance.id

      url = "#{Rails.root}/storage/#{attachment.pluralize}/#{id}/original/#{name}"

      instance.send(attachment.to_sym).attach(
        io: open(url),
        filename: name,
        content_type: content_type
        )
    end
  end
end
