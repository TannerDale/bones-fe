FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    email { Faker::Internet.email }
    token { ['a'..'z'].sample }
    google_id { Faker::Lorem.word }
  end
end
