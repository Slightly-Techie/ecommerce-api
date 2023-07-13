module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :confirm_email, mutation: Mutations::ConfirmEmail
    field :user_login, mutation: Mutations::UserLogin
    field :user_logout, mutation: Mutations::UserLogout
    field :resend_confirmation_email, mutation: Mutations::ResendConfirmationEmail
  end
end
