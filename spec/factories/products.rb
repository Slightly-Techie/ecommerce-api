# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  categories          :text             default([]), is an Array
#  description         :text
#  discount_percentage :decimal(, )
#  in_stock            :boolean          default(FALSE), not null
#  is_discounted       :boolean          default(FALSE), not null
#  name                :string
#  price               :decimal(, )
#  published           :boolean          default(FALSE), not null
#  specification       :text
#  views_count         :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :product do
    name { "MyString" }
    price { "9.99" }
    description { "MyText" }
    specification { "MyText" }
    in_stock { false }
    published { false }
  end
end
