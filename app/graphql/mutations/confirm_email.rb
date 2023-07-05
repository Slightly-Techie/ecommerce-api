module Mutations
    class ConfirmEmail < BaseMutation
      argument :token, String, required: true
  
      field :success, Boolean, null: true
      field :errors, [String], null: false
  
      def resolve(token:)
        user = User.find_by(confirmation_token: token)
  
        if user
          if user.confirm_email(token)
            { success: true, errors: [] }
          else
            { success: false, errors: ['Invalid confirmation token'] }
          end
        else
          { success: false, errors: ['User not found'] }
        end
      end
    end
end
  