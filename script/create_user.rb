# Run this script and follow the onscreen instructions:
#   bundle exec rails r script/create_user.rb

require "csv"

include Rails.application.routes.url_helpers

# Base URL
default_url_options[:host] = ArchiveConfig.APP_URL

def multi_gets(all_text = +"")
  until (text = gets) == "\n"
    all_text << text
  end
  all_text.chomp
end
puts "======== This is the #{Rails.env} environment. ========"
puts <<~PROMPT
  Paste or enter users, one per line, in the format

    USERNAME, EMAIL, PASSWORD

  where

  - USERNAME is their OTW name
  - EMAIL is an email
  - PASSWORD is a password of at least ten characters

  then two line breaks to end:

PROMPT

list = CSV.parse(multi_gets)

users = []
list.each do |user|
  login = user[0].gsub(/\s+/, "")
  email = user[1]&.strip
  password = user[2]&.strip

  u = User.find_or_initialize_by(login: "#{login}")
  success_message = u.new_record? ? "Created and notified" : "Updated"
  u.email = email if email.present?

  # If this is a new admin, we need to set a temporary password.
  if u.new_record?
    u.password = password
    u.password_confirmation = password
  end

  puts "==== #{u.login}"
  if u.save
    puts success_message
    users << u
  else
    puts u.errors.full_messages
  end
  puts
end