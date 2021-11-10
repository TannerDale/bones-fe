require 'rails_helper'

describe PlayDateWithDogsPoro do
  let(:creator_dog) { build :dog_poro }
  let(:invited_dog) { build :dog_poro }
  let(:data) do
    {
      id: 1,
      date: '2021-01-01',
      time: '10:00:00',
      invited_dog: invited_dog,
      creator_dog: creator_dog,
      location_id: 'ewsrdtfyguh',
      invite_status: 'pending'
    }
  end

  let(:play_date) { PlayDateWithDogsPoro.new(data) }

  it "exists" do
    expect(play_date).to be_a PlayDateWithDogsPoro
  end

  it "has attributes" do
    expect(play_date.invited_dog).to be_a DogPoro
    expect(play_date.creator_dog).to be_a DogPoro

    expect(play_date.id).to eq(1)
    expect(play_date.date).to eq('2021-01-01')
    expect(play_date.time).to eq('10:00:00')
    expect(play_date.location_id).to eq('ewsrdtfyguh')
    expect(play_date.invite_status).to eq('pending')
  end
end
