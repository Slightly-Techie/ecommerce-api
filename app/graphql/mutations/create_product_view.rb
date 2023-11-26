module Mutations
  class CreateProductView < BaseMutation
    argument :product_id, ID, required: true

    field :success, Boolean, null: false

    def resolve(product_id:)
      view = ProductView.create(product_id: product_id, user: current_user)

      if view
        respond 200, success: true
      else
        respond 400, success: false, errors: view.errors.full_messages
      end
    end
  end
end
