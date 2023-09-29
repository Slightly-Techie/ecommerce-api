module Mutations
  class VerifyResetToken < BaseMutation
    argument :reset_token, String, required: true

    field :success, Boolean, null: true

    def resolve(reset_token:)
      user = User.find_by!(password_reset_token: reset_token)

      if user.token_expired?
        respond 400, success: false, errors: { reset_token: "Invalid or expired reset token." }
      else
        respond 200, success: true, errors: nil
      end

      rescue ActiveRecord::RecordNotFound => e
        respond 400, success: false, errors: { reset_token: "Invalid or expired reset token." }
    end
  end
end
