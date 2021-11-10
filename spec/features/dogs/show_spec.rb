require 'rails_helper'

describe 'Dog Show Page', :vcr do
  let(:user) { create :user }
  let(:dog) { build :dog_with_play_dates_poro }

  before :each do
    allow(DogFacade).to receive(:find_dog).and_return(dog)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dog_path(dog.id)
  end

  it 'displays a dogs information' do
    expect(page).to have_content(dog.name)
    expect(page).to have_content(dog.age)
    expect(page).to have_content(dog.breed)
    expect(page).to have_content(dog.size)
    expect(page).to have_content(dog.sex)
    expect(page).to have_content(dog.vaccinated)
    expect(page).to have_content(dog.trained)

    dog.accepted_play_dates.each do |pd|
      expect(page).to have_content(pd.date)
    end

    dog.pending_play_dates.each do |pd|
      expect(page).to have_content(pd.date)
    end
  end
end
