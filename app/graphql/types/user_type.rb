# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String
    field :email, String
    field :password_digest, String
    field :active, Boolean
    field :points, Float
    field :email_confirmed, Boolean
    field :password_reset_token, String
    field :confirmation_token, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :id, Types::IntType
    field :username, String
    field :email, String
    field :password_digest, String
    field :active, Boolean
    field :points, Float
    field :email_confirmed, Boolean
    field :password_reset_token, String
    field :confirmation_token, String
  end
end
