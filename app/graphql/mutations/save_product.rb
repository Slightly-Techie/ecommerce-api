module Mutations
  class SaveProduct < BaseMutation
    argument :product_id,ID, required: true

    field :success,Boolean, null: false

    def resolve(product_id:)
      saved_product = SavedProduct.create(product_id: product_id, user: current_user)

      if saved_product
        respond 200,sucess:true
      else
        respond 400, success:false, errors: saved_product.errors.full_messages
      end
    end
  end
end
