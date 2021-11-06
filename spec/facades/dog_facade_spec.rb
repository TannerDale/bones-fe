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
    page = 1
    result = DogFacade.dogs(page)
    all_poros = result.all? { |i| i.is_a? DogPoro }

    expect(result).to be_an Array
    expect(all_poros).to be true
  end

  it 'can get an array of a users dogs' do
    result = DogFacade.user_dogs(params[:user_id])
    all_poros = result.all? { |i| i.is_a? DogPoro }

    expect(result).to be_an Array
    expect(result.count).to eq(1)
    expect(all_poros).to be true
  end
end
