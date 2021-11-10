require 'rails_helper'

RSpec.describe 'playdates#index', :vcr do
  let!(:locations) { build_list :location_poro, 20 }
  let(:user) { create :user }
  let!(:dogs) { DogFacade.dogs(1) }
  let!(:invited_dog) { dogs.first }
  let!(:host_dog) { dogs.last }
  let!(:play_dates) { build_list :play_date_poro, 5 }

  before :each do
    allow(DogFacade).to receive(:user_dogs).and_return([host_dog])
    allow(PlayDateFacade).to receive(:find_for_user).and_return(play_dates)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create_cookie(:invited_dog, invited_dog.id)

    visit play_dates_path
  end

  it 'displays each playdates date' do
    expect(page).to have_content('My Playdates!')
    expect(page).to have_content(play_dates.first.date)
  end

  it 'has a link to each playdates show page' do
    id = play_dates.first.id

    play_dates.each do |pd|
      expect(page).to have_content("Playdate with #{pd.id}")
    end

    click_link "#{play_dates.first.id}"

    expect(current_path).to eq(play_date_path(id))
  end
end
