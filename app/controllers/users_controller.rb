class UsersController < ApplicationController

    def forgot_password
        user = User.find_by(email: params[:email])
        if user
            user.send_password_reset_email
        end
        
        render  json: { alerts: ["We have sent an email to your registered email address, please follow the instruction to reset your password." ] }, status: :ok

    end
end