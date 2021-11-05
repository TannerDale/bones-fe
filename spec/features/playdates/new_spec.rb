require 'rails_helper'

RSpec.describe 'playdates#new' do
  let!(:locations) { build_list :location_poro, 20 }
  let(:user) { create :user }
  let(:host_dog) { create :dog }
  let(:invited_dog) { create :dog }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_play_date_path
  end

  it 'has a form to create a new playdate' do
    expect(page).to have_content("New Playdate!")
    expect(page).to have_field(:date)
    expect(page).to have_field(:time)

    fill_in :date, with: "2021/10/20"
    fill_in :time, with: "05:00 AM"

    click_button "Create Playdate"

    expect(current_path).to eq(dashboard_path)
  end
end
