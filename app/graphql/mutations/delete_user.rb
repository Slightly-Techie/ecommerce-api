module Mutations
  class DeleteUser < BaseMutation
    argument :password, String, required: true

    field :success, Boolean, null: false

    def resolve(password:)
      if current_user.authenticate(password)
        current_user.destroy!
        respond 200, success: true
      else
        respond 422, success: false, errors: { user: "Operation failed." }
      end
    end
  end
end
