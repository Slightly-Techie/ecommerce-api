# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
    default_url_options[:host] = 'http://127.0.0.1:8080/'  # Replace with your actual host and port
  
    def confirmation_email(user)
      @user = user
      mail(to: @user.email, subject: 'Confirm Your Email')
    end
  end
  
