module Mutations
  class PasswordResetEmail < BaseMutation
    argument :email, String, required: true

    field :success, Boolean, null: true
    field :errors, [String], null: false

    def resolve(email:)
      user = User.find_by(email: email)

      if user&.send_password_reset_email
        respond 200, success: true, errors: []
      else
        respond 400, success: false, errors: ["Invalid Email Address"]
      end
    end
  end
end
