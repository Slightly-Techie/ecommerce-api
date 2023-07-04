module Mutations
  class CreateUser < BaseMutation
    argument :other_names, String, required: false
    argument :last_name, String, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
<<<<<<< HEAD
    field :errors, [String], null: true

    def resolve(username:, email:, last_name:, other_names:, password:)
=======
    field :errors, [String], null: false

    def resolve(username:, email:, password:)
>>>>>>> fd74ba9 (implemented user sugn ups)
      password_digest = BCrypt::Password.create(password)

      user = User.new(
        username: username,
        email: email,
<<<<<<< HEAD
        other_names: other_names,
        last_name: last_name,
=======
>>>>>>> fd74ba9 (implemented user sugn ups)
        password_digest: password_digest,
        active: true,
        email_confirmed: false,
        points: 0.0
      )

      if user.save
<<<<<<< HEAD
        respond 201, user: user, error: []
      else
        respond 400, user: nil, error: user.errors
=======
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
>>>>>>> fd74ba9 (implemented user sugn ups)
      end
    end
  end
end
