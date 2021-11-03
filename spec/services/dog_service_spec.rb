require 'rails_helper'

describe DogService do
  let(:json) do
    {
      data: {
        name: 'a',
        breed: 'b',
        age: 1,
        size: 'c',
        vaccinated: '1',
        trained: '2',
        user_id: 3
      }
    }.to_json
  end

  it 'forwards the request to the client' do
    stub_request(:post, "http://localhost:5000/api/v1/dogs")
         .with(
           body: {"data"=>{"name"=>"a", "breed"=>"b", "age"=>1, "size"=>"c", "vaccinated"=>"1", "trained"=>"2", "user_id"=>3}},
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v1.8.0'
           })
         .to_return(status: 200, body: "", headers: {})


    result = DogService.create_dog(json)

    expect(result).to be_empty
  end
end
