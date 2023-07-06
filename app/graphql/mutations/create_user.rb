module Mutations
  class CreateUser < BaseMutation
    argument :other_names, String, required: false
    argument :last_name, String, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(username:, email:, last_name:, other_names:, password:)
      password_digest = BCrypt::Password.create(password)

      user = User.new(
        username: username,
        email: email,
        other_names: other_names,
        last_name: last_name,
        password_digest: password_digest,
        active: true,
        email_confirmed: false,
        points: 0.0
      )

      if user.save
        respond 201, user: user, error: []
      else
        respond 400, user: nil, error: user.errors
      end
    end
  end
end
