module Mutations
    class AddToCart < BaseMutation
        argument :product_id,ID, required: true

        field :success,Boolean, null: false
        field :cart,Types::CartType, null: true

        def resolve(product_id:)
            cart = Cart.create(product_id: product_id, user:  current_user)

            if cart
                respond 200,success:true, cart: cart
            else
                respond 400, success:false, errors: cart.errors.full_messages
            end
        end
    end
    end