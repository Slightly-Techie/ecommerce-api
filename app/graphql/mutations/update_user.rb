module Mutations
  class UpdateUser < BaseMutation
    argument :id, ID, required: true
    argument :username, String, required: false
    argument :email, String, required: false
    argument :password_digest, String, required: false
    argument :active, Boolean, required: false
    argument :points, Float, required: false
    argument :email_confirmed, Boolean, required: false
    argument :password_reset_token, String, required: false
    argument :confirmation_token, String, required: false

    field :user, Types::UserType, null: false

    def resolve(id:, **args)
      user = User.find(id)
      user.update!(args)
      { user: user }
    end
  end
end
