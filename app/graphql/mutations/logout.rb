module Mutations
  class Logout < BaseMutation
    field :success, Boolean, null: false

    def resolve
      context[:current_user]&.update!(auth_token: nil)
      { success: true }
    end
  end
end
