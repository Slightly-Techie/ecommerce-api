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
require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
