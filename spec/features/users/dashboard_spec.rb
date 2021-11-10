require 'rails_helper'

describe 'Dashboard Index', :vcr do
  let(:user) { create :user }
  let!(:dogs) { build_list :dog_poro, 3, user_id: user.id }
  let(:dog1) { build :dog_with_play_dates_poro }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow(DogFacade).to receive(:user_dogs).and_return(dogs)
    allow(DogFacade).to receive(:find_dog).and_return(dog1)

    visit dashboard_path
  end

  describe 'Profile information' do
    it 'has a link to edit user profile' do
      within '#location' do
        expect(page).to have_link('Edit Profile')
        click_link('Edit Profile')
      end

      expect(current_path).to eq(edit_user_path(user.id))
    end
  end

  describe 'Create dog' do
    it 'has a link to create a dog' do
      expect(page).to have_link('Add new dog')
      click_link('Add new dog')
      expect(current_path).to eq(new_dog_path)
    end
  end

  describe 'Displays users dogs' do
    it 'has a link to each dogs show page' do
      dog = dogs.first
      expect(page).to have_link(dog.name)
      click_link(dog.name)

      expect(current_path).to eq(dog_path(dog.id))
    end
  end

  describe 'Displays pending playdate invites' do
  end

  describe 'test nav bar links' do
  end
end
