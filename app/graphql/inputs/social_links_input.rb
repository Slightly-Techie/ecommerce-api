module Inputs
  class SocialLinksInput < BaseInput
    argument :twitter, String, required: false
    argument :github, String, required: false
    argument :instagram, String, required: false
    argument :linkedin, String, required: false
    argument :youtube, String, required: false
    argument :website, String, required: false
  end
end
