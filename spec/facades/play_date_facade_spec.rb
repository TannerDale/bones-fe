require 'rails_helper'

describe PlayDateFacade, :vcr do
  let(:location) { build :location_poro }
  let(:invited_dog) { build :dog_poro }
  let(:host_dog) { build :dog_poro }
  let(:params) do
    {
      date: Date.today,
      time: "05:00 AM",
      creator_dog_id: 1,
      location_id: location.id,
      invited_dog_id: 2
    }
  end

  it 'forwards the request to the client' do
    json = PlayDateSerializer.serialize(params)
    result = PlayDateFacade.create_play_date(json)

    expect(result).to be_empty
    expect(result).to be_a String
  end
end
