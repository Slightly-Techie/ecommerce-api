module Queries

  class FetchSavedProducts < BaseQuery
    type Types::ProductType.connection_type, null: false

    def resolve
      # fetch a list of products saved by the current user
     current_user.saved_products.includes(:product).map(&:product)
    end
  end
end