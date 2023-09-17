module Mutations
  class UpdateUser < BaseMutation
    argument :user_input, Inputs::UserInput, required: true

    field :user, Types::UserType, null: true

    def resolve(user_input:)
      if current_user.update(user_input.to_h)
        respond 200, user: current_user
      else
        respond 400, errors: current_user.errors
      end
    end
  end
end
