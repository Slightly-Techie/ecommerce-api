module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :username, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve(email:, username:, password:)
      user = User.where(["email = ? or username = ?", email, username]).first

      raise GraphQL::ExecutionError, "Invalid credentials" unless user&.authenticate(password)

      { user: user, token: user.token }
    end
  end
end
