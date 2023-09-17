module Mutations
  class ChangePassword < Mutations::BaseMutation
    argument :old_password, String, required: true
    argument :new_password, String, required: true

    field :success, Boolean, null: true

    def resolve(old_password:, new_password:)
      ensure_authorized!

      if current_user.authenticate(old_password)
        current_user.update(password: new_password)
        respond 200, success: true
      else
        respond 401, errors: { password: "password change failed" }
      end
    end
  end
end
