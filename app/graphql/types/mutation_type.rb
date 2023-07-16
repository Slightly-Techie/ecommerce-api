module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :confirm_email, mutation: Mutations::ConfirmEmail
    field :password_reset_email, mutation: Mutations::PasswordResetEmail
    field :resend_confirmation_email, mutation: Mutations::ResendConfirmationEmail
  end  
end
