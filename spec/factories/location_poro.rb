FactoryBot.define do
  factory :location_poro do
    id { (1..100).to_a.sample }
    name { Faker::Name.first_name }
    address { 'Main St, Denver' }
    phone { '9737268527' }
    rating { (1..5).to_a.sample }
    image_url { 'https://s3-media4.fl.yelpcdn.com/bphoto/4Tfw-AgjlGw6ZM9LDSLU0g/o.jpg' }

    initialize_with { new(attributes) }
  end
end
