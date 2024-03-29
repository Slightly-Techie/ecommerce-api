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
  acts_as_taggable_on :categories
  is_impressionable counter_cache: true, column_name: :views_count, unique: :session_hash

  has_many :reviews, dependent: :destroy
  has_many :views, class_name: "ProductView", dependent: :destroy
  
  has_many :items
  has_many :orders, through: :items

  scope :published, -> { where(published: true) }
  scope :discounted, -> { where(is_discounted: true) }
end
