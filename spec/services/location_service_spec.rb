require 'rails_helper'

describe LocationService, :vcr do
  xit 'forwards the request to the client' do
    result = LocationService.nearby_locations('Denver')

    expect(result).to be_empty
  end
end
