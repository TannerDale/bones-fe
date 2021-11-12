require 'rails_helper'

RSpec.describe "playdate#show", :vcr do
  let(:user) { create :user }
  let!(:dogs) { DogFacade.dogs(1) }
  let!(:invited_dog) { dogs.first }
  let!(:host_dog) { dogs.last }
  let!(:location) { build :location_poro, id: 'MWFGHr6NOg7pAoLgbgFdsQ', name: 'Doppio Coffee' }
  let!(:play_date) do
    {
      id: 1,
      attributes: {
        date: '2021-11-20',
        time: '10:00:00',
        location_id: location.id
      },
      invite_status: 'pending',
      invited_dog_id: invited_dog.id,
      creator_dog_id: host_dog.id,
      relationships: {
        creator_dog: { data: { id: host_dog.id } },
        invited_dog: { data: { id: invited_dog.id } }
      }
    }
  end

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    allow(PlayDateService).to receive(:search_by_id).and_return(play_date)

    allow(LocationFacade).to receive(:search_by_id).and_return(location)

    visit play_date_path(play_date[:id])
  end

  it 'displays playdate location attributes' do
    expect(page).to have_content(location.name)
    expect(page).to have_content(location.address)
  end

  it 'displays playdate attributes' do
    expect(page).to have_content(play_date[:date])
    expect(page).to have_content(play_date[:time])
  end

  it 'displays playdate dogs attributes' do
    expect(page).to have_content(invited_dog.name)
    expect(page).to have_content(host_dog.name)
  end
end
