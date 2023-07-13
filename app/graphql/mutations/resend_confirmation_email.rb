module Mutations
    class ResendConfirmationEmail < BaseMutation
        argument :email, String, required: true

        field :success, Boolean, null: true
        field :errors, [String], null: false

        def resolve(email:)
            user = User.find_by(email: email)

            if user && !user.confirmed?
                user.send_confirmation_email
                { success: true, errors: [] }
            else
                { success: false, errors: ["Invalid Email Address"] }
            end
        
        end
    
    end
end    