module Mutations
  class FilterProducts < BaseMutation
    argument :name, String, required: false
    argument :in_stock, String, required: false
    argument :price, Float, required: false
    argument :categories, Text, required: false
    argument :is_discounted, Boolean, required: false
    argumenr :specification, Text, required: false


    field :products, [Types::ProductType], null: true

    def resolve(params)
      products = Product.filter_by(params.to_h)
      respond 200, products: products
    end
  end
end
