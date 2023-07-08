class UserMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to the ST Market")
  end

  def forgot_password_mail
    # ...
  end
end
