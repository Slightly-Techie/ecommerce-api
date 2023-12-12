# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  canceled_at  :datetime
#  completed_at :datetime
#  order_number :string
#  returned_at  :datetime
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy

  after_create :set_order_number

  def order_total
    items.map(&:item_total_price).sum
  end

  

    def set_order_number
        self.order_number = SecureRandom.hex(8).upcase
        save!
    end
end
