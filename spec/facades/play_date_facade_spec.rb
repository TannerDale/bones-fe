require 'rails_helper'

describe PlayDateFacade, :vcr do
  let(:location) { build :location_poro }
  let!(:dogs) { DogFacade.dogs(1) }
  let(:invited_dog) { dogs.first }
  let(:host_dog) { dogs.last }
  let(:params) do
    {
      date: Date.today,
      time: "05:00 AM",
      creator_dog_id: host_dog.id,
      location_id: location.id,
      invited_dog_id: invited_dog.id
    }
  end

  it 'forwards the request to the client' do
    json = PlayDateSerializer.serialize(params)
    result = PlayDateFacade.create_play_date(json)

    expect(result).to be_empty
    expect(result).to be_a String
  end
end
