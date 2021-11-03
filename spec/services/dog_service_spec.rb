require 'rails_helper'

describe DogService, :vcr do
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
    result = DogService.create_dog(json)

    expect(result).to be_empty
  end
end
