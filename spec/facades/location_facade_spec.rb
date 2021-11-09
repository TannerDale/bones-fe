require 'rails_helper'

describe LocationFacade, :vcr do
  it 'creates location poros for nearby locations' do
    result = LocationFacade.nearby_locations('Denver')

    expect(result).to be_an Array
    expect(result.first).to be_a LocationPoro
  end
end
