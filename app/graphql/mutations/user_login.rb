module Mutations
    class UserLogin < BaseMutation
        argument :email, String, required: true
        argument :password String, required: true

        field :token, String, null: true

        def resolve(email:, password:)
            user = User.find_by(email: email)

            return unless user
            return unless user.valid_password?(password)

            user.sessions.create.token
        end
    end
end