# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  active               :boolean
#  confirmation_token   :string
#  email                :string
#  email_confirmed      :boolean
#  password_digest      :string
#  password_reset_token :string
#  points               :decimal(, )
#  username             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
FactoryBot.define do
  factory :user do
    id { 1 }
    username { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    active { false }
    points { "9.99" }
    email_confirmed { false }
    password_reset_token { "MyString" }
    confirmation_token { "MyString" }
  end
end
