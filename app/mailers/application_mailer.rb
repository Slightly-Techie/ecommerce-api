class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("shop@slightlytechie.com", "Kwame from Slightly Techie")
  layout "mailer"
end
