require 'rails_helper'

describe LocationService, :vcr do
  it 'forwards the request to the client' do
    result = LocationService.nearby_locations('Denver')

    expect(result).to_not be_empty
  end
end
