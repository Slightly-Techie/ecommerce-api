module Mutations
  class SaveProduct < BaseMutation
    include Authorizable

    argument :product_id,ID, required: true

    field :success,Boolean, null: false
    field :product,Types::ProductType,null:false

    def resolve(product_id:)
      saved_product = SavedProduct.create(product_id: product_id, user: current_user)

      if saved_product
        respond 200,success:true,product: saved_product.product
      else
        respond 400, success:false, errors: saved_product.errors.full_messages
      end
    end
  end
end
