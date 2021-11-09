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
          accepted_play_dates: [{
            invited_dog_id: 2,
            creator_dog_id: 3,
            date: Date.today + 1,
            time: Time.new+ 1,
            location_id: "asdasdad",
            invite_status: 'Rejected'
          }],
          pending_play_dates: [{
            invited_dog_id: 1,
            creator_dog_id: 1,
            date: (Date.today + 1),
            time: (Time.new + 1),
            location_id: "asdasdad",
            invite_status: 'Nice'
          }]
        }
      end
    initialize_with { new(attributes) }
  end
end
