module Queries
  class FetchProductCategories < BaseQuery
    type [Types::ProductType], null: false

    def resolve
      Product.distinct.pluck(:categories)
    end
  end
end
