require 'rails_helper'

RSpec.describe 'locations#index' do
  let(:locations) { build_list :location_poro, 20 }
  let(:user) { create :user }
  let(:dog) { create :dog }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit locations_path
  end

  it "displays location info" do
    locations.map do |location|
      expect(page).to have_content(location.name)
      expect(page).to have_content(location.address)
      expect(page).to have_content(location.phone)
      expect(page).to have_content(location.rating)
      expect(page).to have_button("Select #{location.name} for your playdate!")
    end
  end
end
