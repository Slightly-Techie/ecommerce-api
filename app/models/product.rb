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
class Product < ApplicationRecord
  has_many_attached :images
  act_as_taggable_on :categories

  has_many :reviews, dependent: :destroy
  has_many :views, class_name: "ProductView", dependent: :destroy

  scope :published, -> { where(published: true) }
  scope :discounted, -> { where(is_discounted: true) }
end
