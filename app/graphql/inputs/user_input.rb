module Inputs
  class UserInput < BaseInput
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :phone_number, String, required: false
    argument :social_links, Inputs::SocialLinksInput, required: false
  end
end
