module Types
  class SocialLinks < Types::BaseObject
    field :twitter, String, null: true
    field :github, String, null: true
    field :instagram, String, null: true
    field :linkedin, String, null: true
    field :youtube, String, null: true
    field :website, String, null: true
  end
end
