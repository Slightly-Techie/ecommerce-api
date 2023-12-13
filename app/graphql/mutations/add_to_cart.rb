module Mutations
    class AddToCart < BaseMutation
        argument :user_id, ID, required: true
        argument :product_id, ID, required: true
        argument :quantity, Integer, required: true

        type Types::CartType

        def resolve(params)
            user = User.find(user_id)
            cart = user.cart || user.create_create

            product = Product.find(product_id)
            item = cart.items.find_or_initialize_by(product: product)
            item.update(quantity: item.quantity + quantity)

            cart
        end
    end
end