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
