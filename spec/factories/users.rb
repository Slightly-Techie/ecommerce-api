# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  account_type          :integer          default("NON_TECHIE")
#  active                :boolean          default(FALSE)
#  confirmation_token    :string
#  email                 :string           not null
#  email_confirmed       :boolean          default(FALSE)
#  first_name            :string
#  last_name             :string
#  password_digest       :string           not null
#  password_reset_token  :string
#  phone_number          :string
#  social_links          :jsonb
#  token_expiration_date :datetime
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_username  (username)
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
