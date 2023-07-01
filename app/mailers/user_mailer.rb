class UserMailer < ApplicationMailer
    default_url_options[:host] = 'http://127.0.0.1:8080/'  # Replace with your actual host and port
  
    def confirmation_email(user)
      @user = user
      mail(to: @user.email, subject: 'Confirm Your Email')
    end
  end

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirm Your Email')
  end

  def forgot_password_mail(user)
    @user = user
    mail(to: @user.email, subject: "Reset Your Password")
  end
  
end
