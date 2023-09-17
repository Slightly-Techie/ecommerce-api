module Mutations
  class SetAccountType < BaseMutation
    argument :account_type, Types::AccountType, required: true

    field :user, Types::UserType, null: true

    def resolve(account_type:)
      if account_type == "TECHIE"
        user_info = CrmService.fetch_user_info(current_user.email)

        if user_info
          current_user.update(
              account_type: account_type,
              first_name: user_info["first_name"],
              last_name: user_info["last_name"],
              phone_number: user_info["phone_number"]
            )
          respond 200, user: current_user
        else
          respond 400, message: "Sorry #{current_user.username}, the email you used to sign up is not registered in our CRM"
        end
      elsif account_type == "NON_TECHIE"
        current_user.update(account_type: account_type)
        respond 200, user: current_user
      end
    end
  end
end
