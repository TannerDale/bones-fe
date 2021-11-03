require 'rails_helper'

describe BackendClient, :vcr do
  let(:params) do
    {
      name: 'a',
      breed: 'b',
      age: 1,
      size: 1,
      vaccinated: 0,
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
