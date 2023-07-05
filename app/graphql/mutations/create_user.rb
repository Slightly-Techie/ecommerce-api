class Mutations::CreateUser < Mutations::BaseMutation
  field :user, Types::UserType, null: true

  argument :other_names, String, required: false
  argument :lastname, String, required: true
  argument :username, String, required: true
  argument :password, String, required: true

  def execute(params)
    user = User.create!(params)
    respond 201, user: user
  end
end