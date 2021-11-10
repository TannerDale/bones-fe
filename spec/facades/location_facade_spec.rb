require 'rails_helper'

describe LocationFacade, :vcr do
  it 'creates location poros for nearby locations' do
    result = LocationFacade.nearby_locations('Denver')
    
    expect(result).to be_an Array
    expect(result.first).to be_a LocationPoro
  end

  it 'finds location by id' do
    result = LocationFacade.search_by_id('MWFGHr6NOg7pAoLgbgFdsQ')

    expect(result).to be_a LocationPoro
    expect(result.id).to eq('MWFGHr6NOg7pAoLgbgFdsQ')
    expect(result.name).to eq('Doppio Coffee')
  end
end
