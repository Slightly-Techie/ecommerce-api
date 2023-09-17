module Mutations
  class Login < BaseMutation
    argument :email, String, required: false
    argument :username, String, required: false
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve(email: nil, username: nil, password:)
      user = User.active.where("email = ? OR username = ?", email, username).first

      if user&.authenticate(password)
        respond 200, user: user, token: user.token
      else
        respond 401, errors: { user: "Invalid credentials" }
      end
    end
  end
end
