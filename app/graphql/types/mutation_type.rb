module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :confirm_email, mutation: Mutations::ConfirmEmail
    field :resend_email_otp, mutation: Mutations::ResendConfirmationEmail
    field :login, mutation: Mutations::Login
    field :forgot_password, mutation: Mutations::ForgotPassword
    field :reset_password, mutation: Mutations::ResetPassword
    field :change_password, mutation: Mutations::ChangePassword
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser
  end
end
