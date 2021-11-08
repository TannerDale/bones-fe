FactoryBot.define do
  factory :dog_with_play_dates_poro do
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
          user_id: (1..100).to_a.sample,
          accepted_play_dates: (build_list :play_date_poro, 2),
          pending_play_dates: (build_list :play_date_poro, 2)
        }
      end
    initialize_with { new(attributes) }
  end
end
