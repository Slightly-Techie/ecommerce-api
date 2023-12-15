module Queries
    class FetchOrder < BaseQuery
        argument :id, ID, required: true
        argument :order_number, String, required: true
        argument :order_amount, Float, required: true
        argument :order_type, String, required: true
        argument :order_status, String, required: true
        argument :created_at, String, required: true

        type Types::OrderType, null: false

        def orders(id:, order_number:, order_amount:, order_type:, order_status:, order_date:)
            orders = current_user.orders.where(id: id)
            orders = current_user.orders.where(order_number: order_number) if order_number.present?
            orders = current_user.orders.where(order_amount: order_amount) if order_amount.present?
            orders = current_user.orders.where(order_type: order_type) if order_type.present?
            orders = current_user.orders.where(order_status: order_status) if order_status.present?
            orders = current_user.orders.where('order_date >= ?', created_at) if created_at.present?

            orders
        end
    end
end