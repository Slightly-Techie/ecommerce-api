# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  active               :boolean          default(FALSE)
#  confirmation_token   :string
#  email                :string           not null
#  email_confirmed      :boolean          default(FALSE)
#  last_name            :string
#  other_names          :string
#  password_digest      :string           not null
#  password_reset_token :string
#  points               :decimal(, )      default(0.0)
#  username             :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_password_reset_token  (password_reset_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
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
