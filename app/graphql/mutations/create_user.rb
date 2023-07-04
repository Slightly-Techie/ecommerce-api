module Mutations
  class CreateUser < BaseMutation
    argument :username, String, required: true
    argument :email, String, required: true
    argument :password_digest, String, required: true
    argument :active, Boolean, required: true
    argument :points, Float, required: false
    argument :email_confirmed, Boolean, required: true
    argument :password_reset_token, String, required: false
    argument :confirmation_token, String, required: false

    field :user, Types::UserType, null: false

    def resolve(**args)
      user = User.create!(args)
      { user: user }
    end
  end
end
