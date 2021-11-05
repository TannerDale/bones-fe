FactoryBot.define do
  factory :location_poro do
    attributes = {
      id: [1..100].sample,
      name: Faker::Name.unique.first_name,
      address: Faker::Address.unique,
      phone: Faker::PhoneNumber.unique,
      rating: [1..5].sample
    }
    initialize_with { new(attributes) }
  end
end
