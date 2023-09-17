module Mutations
  class ConfirmEmail < BaseMutation
    argument :token, String, required: true

    field :token, String, null: true
    field :success, Boolean, null: true

    def resolve(token:)
      user = User.find_by!(confirmation_token: token)

      if user.email_confirmed?
        respond 400, success: false, errors: { email: "Email already confirmed" }
      elsif user.token_expired?
        respond 400, success: false, errors: { email: "Token expired" }
      else
        user.confirm!
        respond 200, success: true, token: user.token
      end

      rescue ActiveRecord::RecordNotFound => e
        respond 400, success: false, errors: { email: "Invalid token" }
    end
  end
end
