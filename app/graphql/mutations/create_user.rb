module Mutations
  class CreateUser < BaseMutation
    argument :first_name, String, required: false
    argument :last_name, String, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :errors, [String], null: true

    def resolve(params)
      user = User.new(params.to_h)

      if user.save
        respond 201, user: user, errors: []
      else
        respond 400, user: nil, errors: user.errors
      end
    end
  end
end
