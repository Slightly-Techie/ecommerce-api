module Queries
    class Orders < BaseQuery
        type [Types::OrderType], null: false

        def resolve
            view_orders = current_user.Order.all
        end
    end
end