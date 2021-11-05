require 'rails_helper'

RSpec.describe 'locations#index' do
  let!(:locations) { build_list :location_poro, 20 }
  let(:user) { create :user }
  let(:dog) { build :dog_poro }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow(LocationFacade).to receive(:nearby_locations).and_return(locations)
    allow(DogFacade).to receive(:user_dogs).and_return([dog])

    visit locations_path
  end

  it "displays location info" do
    locations[..19].each do |location|
      expect(page).to have_content(location.name)
      expect(page).to have_content(location.address)
      expect(page).to have_content(location.phone)
      expect(page).to have_content(location.rating)
      expect(page).to have_button("Select #{location.name} for your playdate!")
    end

    click_button "Select #{locations[0].name} for your playdate!"
    expect(current_path).to eq(new_play_date_path)
  end
end
