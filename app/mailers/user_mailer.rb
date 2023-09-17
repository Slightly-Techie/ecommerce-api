class UserMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user
    subject = "Welcome to the ST Market 🌟🎉"
    mail(to: @user.email, subject: subject)
  end

  def confirmation_mail(user)
    @user = user
    subject = "Confirm your email 📬"
    mail(to: @user.email, subject: subject)
  end

  def forgot_password_mail(user)
    @user = user
    subject = "Reset Your Password 🔑🔐"
    mail(to: @user.email, subject: subject)
  end
end
