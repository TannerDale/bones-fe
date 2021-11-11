require 'rails_helper'

describe PlayDateFacade, :vcr do
  let(:location) { build :location_poro }
  let!(:dogs) { DogFacade.dogs(1) }
  let(:invited_dog) { dogs.first }
  let(:host_dog) { dogs.last }
  let(:params) do
    {
      date: Date.today,
      time: '05:00 AM',
      creator_dog_id: host_dog.id,
      location_id: location.id,
      invited_dog_id: invited_dog.id
    }
  end
  let!(:data) do
    { attributes:
      {
        id: 1,
        date: '2021-11-20',
        time: '10:00:00',
        invite_status: 'pending',
        invited_dog_id: invited_dog.id,
        creator_dog_id: host_dog.id,
        location_id: location.id
      },
      relationships: {
        creator_dog: { data: { id: host_dog.id } },
        invited_dog: { data: { id: invited_dog.id } }
      }
    }
  end

  it 'forwards the request to the client / create' do
    json = PlayDateSerializer.serialize(params)
    result = PlayDateFacade.create_play_date(json)

    expect(result).to be_empty
    expect(result).to be_a String
  end

  it 'finds the playdates for a user' do
    result = PlayDateFacade.find_for_user(1)

    expect(result).to be_an Array
  end

  it 'updates play date' do
    result = PlayDateFacade.update_play_date(3, 1)

    expect(result).to be_empty
  end

  it 'all_play_date_info' do
    result = PlayDateFacade.all_play_date_info(3)

    expect(result).to be_a PlayDateWithDogsPoro
  end

  it 'can format data' do
    allow(PlayDateService).to receive(:find_for_user).and_return([data])
    result = PlayDateFacade.find_for_user(1)

    expect(result).to be_an Array
    expect(result.first).to be_a PlayDatePoro
  end
end
