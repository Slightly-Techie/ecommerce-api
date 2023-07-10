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
      user = User.new(
        username: params[:username],
        email: params[:email],
        first_name: params[:first_name],
        last_name: params[:last_name],
        password: params[:password]
      )

      if user.save
        respond 201, user: user, error: []
      else
        respond 400, user: nil, error: user.errors
      end
    end
  end
end
