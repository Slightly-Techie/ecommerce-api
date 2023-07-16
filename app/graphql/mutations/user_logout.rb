module Mutations
    class UserLogin < BaseMutation
        field :success, Boolean, null: false

        def resolve
            context[:current_user]&.update!(token: nil)
            {success: true}
        end
    end
end