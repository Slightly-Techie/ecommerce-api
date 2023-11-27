module Queries
  class FetchProduct < BaseQuery
    argument :id, ID, required: true

    type Types::ProductType, null: false

    def resolve(id:)
      Product.published.find(id)
    end
  end
end
