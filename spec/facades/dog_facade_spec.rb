require 'rails_helper'

describe DogFacade, :vcr do
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
    result = DogFacade.create_dog(json)

    expect(result).to be_empty
  end

  it 'can get an array of dog poros' do
    result = DogFacade.dogs(1)
    all_poros = result.all? { |i| i.is_a? DogPoro }

    expect(result).to be_an Array
    expect(all_poros).to be true
  end
end
