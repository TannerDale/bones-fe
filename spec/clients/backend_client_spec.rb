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

  it 'forwards the request to the client' do
    json = DogSerializer.new(params).to_json
    result = BackendClient.create_dog(json)

    expect(result).to be_empty
  end

  it 'can get data' do
    result = BackendClient.fetch('/api/v1/pets?page=1')

    expect(result).to be_a Hash
    expect(result).not_to be_empty
  end
end
