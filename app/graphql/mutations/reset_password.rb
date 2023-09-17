module Mutations
  class ResetPassword < BaseMutation
    argument :reset_token, String, required: true
    argument :new_password, String, required: true
    argument :password_confirmation, String, required: true

    field :success, Boolean, null: true

    def resolve(reset_token:, new_password:, password_confirmation:)
      user = User.find_by!(password_reset_token: reset_token)

      if user.token_expired?
        respond 400, success: false, errors: { reset_token: "Invalid or expired reset token." }
      else
        user.update!(
          password: new_password,
          password_confirmation: password_confirmation,
          password_reset_token: nil,
          token_expiration_date: nil
        )
        respond 200, success: true, errors: nil
      end

      rescue ActiveRecord::RecordNotFound => e
        respond 400, success: false, errors: { reset_token: "Invalid or expired reset token." }
    end
  end
end
