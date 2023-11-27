module Queries
  class Products < BaseQuery
    argument :categories, [String], required: false

    type ProductType.connection_type, null: false

    def resolve(categories: nil)
      categories ? Product.published.tagged_with(categories) : Product.published
    end
  end
end
