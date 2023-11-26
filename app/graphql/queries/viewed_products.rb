module Query
  class ViewProducts < BaseQuery
    type Types::ProductType.connection_type, null: false

    def resolve
      current_user.product_views.includes(:product).map(&:product)
    end
  end
end
