module Mutations
  class CreateUser < BaseMutation
    argument :user_input, Inputs::UserInput, required: true

    field :user, Types::UserType, null: true

    def resolve(user_input)
      user = User.new(user_input.to_h)

      if user.save
        user.send_confirmation_email
        respond 201, user: user
      else
        respond 400, errors: user.errors
      end
    end
  end
end
