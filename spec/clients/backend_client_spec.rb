require 'rails_helper'

describe BackendClient, :vcr do
  let(:dog) { build :dog_poro }
  let(:params) do
    {
      name: dog.name,
      breed: dog.breed,
      age: dog.age,
      size: dog.size,
      vaccinated: 1,
      trained: 1,
      user_id: 3
    }
  end

  it 'post data' do
    json = DogSerializer.new(params).to_json
    result = BackendClient.create_dog(json)

    expect(result).to be_empty
  end

  it 'can get data' do
    result = BackendClient.fetch('/api/v1/dogs?page=1')

    expect(result).to be_a Hash
    expect(result).not_to be_empty
  end

  it 'can patch data' do
    url = '/api/v1/play_date/1'
    body = { status: 'accepted' }.to_json

    result = BackendClient.update_play_date(url, body)

    expect(result).to be_empty
  end
end
