module Types
    class CartType < Types::BaseObject
        field :id, ID, null: false
        field :user_id, ID, null: false
        field :items, [Types::Item], null: true
        field :total_price, Decimal, null: true
        field :created_at, GraphQL::Types::ISO8601DateTime, null: false
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
end