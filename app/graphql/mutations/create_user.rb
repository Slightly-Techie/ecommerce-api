module Mutations
  class CreateUser < BaseMutation
    argument :first_name, String, required: false
    argument :last_name, String, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    def resolve(username:, email:, password:)
      password_digest = BCrypt::Password.create(password)

      user = User.new(
        username: params[:username],
        email: params[:email],
        first_name: params[:first_name],
        last_name: params[:last_name],
        password: params[:password]
      )

      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
