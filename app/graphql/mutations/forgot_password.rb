module Mutations
  class ForgotPassword < BaseMutation
    argument :email, String, required: true

    field :success, Boolean, null: false

    def resolve(email:)
      user = User.active.find_by_email(email)

      if user&.send_password_reset_email
        respond 200, success: true
      else
        respond 400, success: false, errors: { email: "Invalid credentials" }
      end
    end
  end
end
