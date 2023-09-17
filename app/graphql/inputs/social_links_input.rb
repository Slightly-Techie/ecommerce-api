module Inputs
  class SocialLinksInput < BaseInput
    argument :twitter, String
    argument :github, String
    argument :instagram, String
    argument :linkedin, String
    argument :youtube, String
    argument :website, String
  end
end
