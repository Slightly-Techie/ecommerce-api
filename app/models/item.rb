# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  unit_price :decimal(7, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :bigint
#  product_id :bigint
#
# Indexes
#
#  index_items_on_order_id    (order_id)
#  index_items_on_product_id  (product_id)
#
class Item < ApplicationRecord
    belongs_to :order
    belongs_to :cart

    def item_total_price
        product.unit_price * quantity
    end

end
