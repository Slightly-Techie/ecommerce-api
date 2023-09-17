module Inputs
  class UserInput < BaseInput
    argument :email, String, required: true
    argument :username, String, required: true
    argument :password, String, required: true
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :phone_number, String, required: false
    argument :social_links, Inputs::SocialLinksInput, required: false
    argument :account_type, Types::AccountType, required: false
  end
end
