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
end
