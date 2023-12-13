# == Schema Information
#
# Table name: saved_products
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_saved_products_on_product_id  (product_id)
#  index_saved_products_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class SavedProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
