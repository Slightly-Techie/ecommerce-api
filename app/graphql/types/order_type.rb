module Types
    class OrderType < Types::BaseObject
        field :id, ID, null: false
        field :user, Types::UserType, null: false
        field :status,Integer, null: false
        field :order_number, String, null: false
        field :order_amount, Float, null: false
        field :order_type, String, null: false
        field :currency, String, null: false
        field :order_service, String, null: false
        field :completed_at, String, null: false
        field :canceled_at, String, null: false
        field :returned_at, String, null: false
        field :created_at, String, null: false
        field :updated_at, String, null: false

    
    end
end