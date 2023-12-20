module Queries
    class FetchSimilarProducts < BaseQuery
      argument :id, ID, required: true
    
      type Types::ProductType.connection_type, null: false
    
      def resolve(id:)
        product = Product.find_by(id: id)
    
        return Product.none unless product
    
        Product.published.tagged_with(product.category_list, any: true).where.not(id: id)
      end
    end
  end
  