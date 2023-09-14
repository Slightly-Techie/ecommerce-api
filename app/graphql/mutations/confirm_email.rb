module Mutations
  class ConfirmEmail < BaseMutation
    argument :token, String, required: true

    field :success, Boolean, null: true
    field :errors, [String], null: false

    def resolve(token:)
      user = User.find_by(confirmation_token: token)

      if user && !user.email_confirmed?
        user.update(email_confirmed: true, confirmation_token: nil, active: true)
        respond 200, success: true, errors: []
      else
        respond 400, success: false, errors: ["Invalid Token"]
      end
    end
  end
end
