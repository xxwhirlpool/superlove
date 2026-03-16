class ApplicationMailer < ActionMailer::Base
  self.delivery_job = ApplicationMailerJob

  layout "mailer"
  helper :mailer
  default from: "superlove " + "<#{ArchiveConfig.RETURN_ADDRESS}>"
end
