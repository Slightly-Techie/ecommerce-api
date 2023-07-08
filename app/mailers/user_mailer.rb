class UserMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the ST Market")
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
