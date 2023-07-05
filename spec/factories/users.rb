# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  active               :boolean
#  confirmation_token   :string
#  email                :string
#  email_confirmed      :boolean
#  last_name            :string
#  other_names          :string
#  password_digest      :string
#  password_reset_token :string
#  points               :decimal(, )
#  username             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
FactoryBot.define do
  factory :user do
    other_names { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Internet.username }
    email { "#{SecureRandom.hex}@example.com" }
    password { Faker::Internet.password }
    points { 0 }
  end
end
