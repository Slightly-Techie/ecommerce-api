module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :confirm_email, mutation: Mutations::ConfirmEmail
    field :resend_confirmation_email, mutation: Mutations::ResendConfirmationEmail
    field :login, mutation: Mutations::Login
    field :forgot_password, mutation: Mutations::ForgotPassword
    field :verify_reset_token, mutation: Mutations::VerifyResetToken
    field :reset_password, mutation: Mutations::ResetPassword
    field :change_password, mutation: Mutations::ChangePassword
    field :update_user, mutation: Mutations::UpdateUser
    field :delete_user, mutation: Mutations::DeleteUser
    field :set_account_type, mutation: Mutations::SetAccountType
    field :view_product, mutation: Mutations::CreateProductView
    field :create_review, mutation: Mutations::CreateReview
    field :update_review, mutation: Mutations::UpdateReview
    field :save_product, mutation: Mutations::SaveProduct
    field :add_to_cart, mutation: Mutations::AddToCart
  end
end
