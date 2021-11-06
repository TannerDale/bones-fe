FactoryBot.define do
  factory :dog_poro do
      id { (1..100).to_a.sample }
      attributes do
        {
          name: Faker::Name.unique.first_name,
          size: %w[small medium large].sample,
          age: (1..15).to_a.sample,
          breed: Faker::Creature::Dog.breed,
          vaccinated: %w[true false].sample,
          trained: %w[yes no].sample,
          sex: %w[male female].sample,
          user_id: (1..100).to_a.sample
        }
      end
    initialize_with { new(attributes) }
  end
end
