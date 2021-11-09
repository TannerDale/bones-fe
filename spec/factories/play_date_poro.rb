FactoryBot.define do
  factory :play_date_poro do
    invited_dog_id { (1..100).to_a.sample }
    creator_dog_id { (1..100).to_a.sample }
    date { Date.today + 1 }
    time { Time.now }
    location_id { '34janised23' }
    invite_status { %w[pending accepted rejected].sample }

    initialize_with { new(attributes) }
  end
end
