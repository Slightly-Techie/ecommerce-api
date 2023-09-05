class UpdateUser < BaseMutation
    argument :email, String, required: true
    field :user, Types::UserType, null: false

    def resolve(email:, password:, context:)
        user = context[:current_user]
        return { user: nil, errors: ["Authentication required"] } unless current_user

        user.find_by(email: email)
        return { user: nil, errors: ["Unauthorized to update profile"] } unless user == current_user

        if user.update(user: user)
            { user: user, errors: [] }
        else
            { user: nil, errors: user.errors.full_messages }
        end
    end

end