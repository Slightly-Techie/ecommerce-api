# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :price, Float
    field :description, String
    field :specification, String
    field :in_stock, Boolean
    field :published, Boolean
    field :reviews_count, Integer
    field :reviews, [Types::ReviewType], null: true
    field :ratings, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def reviews_count
      object.reviews.size
    end

    def ratings
      object.reviews.average(:rating).to_f
    end
  end
end
