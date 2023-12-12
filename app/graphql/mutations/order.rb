module Mutations
    class Order < BaseMutation
        argument :order_number, String, required: true
        argument :order_amount, Decimal, required: true
        argument :order_type, String, required: true
        argument :currency, String, required: true
        argument :order_service, String, required: true

        field :order, Types::OrderType, null: true
        
        def resolve(params)
            order = Order.new(params.to_h)

            if order.save
                respond 201, order: order
            else
                respond 400, errors: order.errors.full_messages
            end
        end

    end
end