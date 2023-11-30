module Queries
  class ViewedProducts < BaseQuery
    type Types::ProductType.connection_type, null: false

    def resolve
      product_with_views = current_user.product_views.includes(:product).map(&:product)

      popular_products = product_with_views.sort_by { |product| product.views_count }.reverse
    end
  end
end
