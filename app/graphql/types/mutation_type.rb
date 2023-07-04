module Types
<<<<<<< HEAD
  class MutationType < Types::BaseObject
=======
>>>>>>> fd74ba9 (implemented user sugn ups)
    field :create_user, mutation: Mutations::CreateUser
    field :confirm_email, mutation: Mutations::ConfirmEmail
    field :user_login, mutation: Mutations::UserLogin
    field :user_logout, mutation: Mutations::UserLogout
  end
end
