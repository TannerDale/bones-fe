require 'rails_helper'

describe DogService, :vcr do
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
    result = DogService.create_dog(json)

    expect(result).to be_empty
  end

  it 'can get dogs and remove the data' do
    result = DogService.fetch_dogs(1)

    expect(result).to be_an Array
    expect(result.first).to be_a Hash
  end

  it 'can find information for one dog form id' do
    result = DogService.find_dog(dog.id)

    expect(result).to be_a Hash
  end
end
