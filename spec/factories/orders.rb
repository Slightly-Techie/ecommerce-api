# == Schema Information
#
# Table name: orders
#
#  id            :bigint           not null, primary key
#  canceled_at   :datetime
#  completed_at  :datetime
#  currency      :string
#  order_amount  :decimal(, )
#  order_number  :string
#  order_service :string
#  order_type    :string
#  returned_at   :datetime
#  status        :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :order do
    user { nil }
    total { "MyString" }
    status { "MyString" }
    order_number { "MyString" }
  end
end
