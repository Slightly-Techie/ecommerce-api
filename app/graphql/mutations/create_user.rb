module Mutations
  class CreateUser < BaseMutation
    argument :email, String, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :username, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve(params)
      user = User.new(params.to_h)

      if user.save
        respond 201, user: user, token: user.token
      else
        respond 400, errors: user.errors.full_messages
      end
    end
  end
end
