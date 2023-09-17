# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :email_confirmed, Boolean, null: false
    field :phone_number, String, null: false
    field :account_type, Types::AccountType, null: false
    field :social_links, Types::SocialLinks, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
