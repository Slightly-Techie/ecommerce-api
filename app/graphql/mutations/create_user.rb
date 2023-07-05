module Mutations
  class CreateUser < BaseMutation
    argument :other_names, String, required: false
    argument :lastname, String, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(username:, email:, lastname:, password:)
      password_digest = BCrypt::Password.create(password)

      user = User.new(
        username: username,
        email: email,
        other_names: other_names
        lastname: lastname
        password_digest: password_digest,
        active: true,
        email_confirmed: false,
        points: 0.0
      )

      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
