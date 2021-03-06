require 'rails_helper'

describe 'Dashboard Index', :vcr do
  let(:user) { create :user, id: 1 }
  let!(:dogs) { build_list :dog_poro, 3, user_id: user.id }
  let(:dog1) { build :dog_with_play_dates_poro }
  let(:dog_fact) { 'Dogs are cooler than humans' }
  let(:play_date) { build :play_date_poro, status: 'pending' }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow(DogFacade).to receive(:user_dogs).and_return(dogs)
    allow(DogFacade).to receive(:find_dog).and_return(dog1)
    allow(DogFactFacade).to receive(:get_fact).and_return(dog_fact)
    allow(PlayDateFacade).to receive(:find_for_user).and_return([play_date])

    visit dashboard_path
  end

  describe 'Profile information' do
    it 'has a link to edit user profile' do
      within '#location' do
        click_link('Pawleese add your location!')
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

  describe 'Shows random dog fact' do
    it 'displays random dog fact' do
      expect(page).to have_content(dog_fact)
    end
  end

  describe 'Displays pending playdate invites' do
  end

  describe 'test nav bar links' do
    it 'links to the dashboard' do
      click_link('Dashboard')

      expect(current_path).to eq(dashboard_path)
    end

    it 'links to edit profile' do
      click_link('Edit Profile')

      expect(current_path).to eq(edit_user_path(user))
    end

    it 'has a log out option' do
      click_link('Logout')

      expect(current_path).to eq(root_path)
    end
  end

  describe 'updating play dates' do
    it 'has buttons to accept or reject pending play dates' do
      expect(page).to have_button 'Accept'
      expect(page).to have_button 'Reject'

      click_button 'Accept'
    end
  end
end
