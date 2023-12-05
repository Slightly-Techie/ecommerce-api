# == Schema Information
#
# Table name: items
#
#  id         :bigint           not null, primary key
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
require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
