module Mutations
  class ResendConfirmationEmail < BaseMutation
    argument :email, String, required: true

    field :success, Boolean, null: false

    def resolve(email:)
      user = User.find_by!(email: email)

      if user.email_confirmed?
        respond 400, success: false, errors: { email: "Email already confirmed" }
      else
        user.send_confirmation_email
        respond 200, success: true
      end
      rescue ActiveRecord::RecordNotFound => e
        respond 400, success: false, errors: { email: "Invalid credentials" }
    end
  end
end
