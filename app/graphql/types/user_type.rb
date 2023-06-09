# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :username, String, null: false
    field :email, String, null: false
    field :password_digest, String, null: false
    field :active, Boolean
    field :points, Float
    field :email_confirmed, Boolean
    field :password_reset_token, String
    field :confirmation_token, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
