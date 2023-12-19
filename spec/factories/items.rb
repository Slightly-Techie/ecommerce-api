# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  unit_price :decimal(, )
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
FactoryBot.define do
  factory :item do
    
  end
end
