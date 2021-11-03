require 'rails_helper'

describe DogFacade, :vcr do
  let(:params) do
    {
      name: 'a',
      breed: 'b',
      age: 1,
      size: 1,
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
