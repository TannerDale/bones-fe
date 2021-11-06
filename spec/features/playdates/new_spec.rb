require 'rails_helper'

RSpec.describe 'playdates#new', :vcr do
  let!(:locations) { build_list :location_poro, 20 }
  let(:user) { create :user }
  let(:host_dog) { build :dog_poro }
  let(:invited_dog) { build :dog_poro }

  before :each do
    allow(DogFacade).to receive(:user_dogs).and_return([host_dog])

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    create_cookie(:invited_dog, 4)

    visit new_play_date_path
  end

  it 'has a form to create a new playdate' do
    expect(page).to have_content("New Playdate!")
    expect(page).to have_field(:date)
    expect(page).to have_field(:time)

    fill_in :date, with: Date.today + 1
    fill_in :time, with: "05:00 AM"
    select host_dog.name

    click_button "Create Playdate"

    expect(current_path).to eq(dashboard_path)
  end

  it 'cannot schedule a date in the past, returns 400 error' do
    fill_in :date, with: Date.today - 1
    fill_in :time, with: "05:00 AM"
    select host_dog.name

    click_button "Create Playdate"

    expect(current_path).to eq(new_play_date_path)
  end

  it 'requires time field to be filled in' do
    fill_in :date, with: Date.today + 1
    select host_dog.name

    click_button "Create Playdate"

    expect(current_path).to eq(new_play_date_path)
  end

  it 'requires date field to be filled in' do
    fill_in :time, with: "05:00 AM"
    select host_dog.name

    click_button "Create Playdate"

    expect(current_path).to eq(new_play_date_path)
  end
end
