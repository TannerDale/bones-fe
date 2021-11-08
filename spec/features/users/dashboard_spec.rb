require 'rails_helper'

describe 'Dashboard Index', :vcr do
  let(:user) { create :user }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
  end

  describe 'Profile information' do
    it 'has a link to edit user profile' do
      within "#location" do
        expect(page).to have_link('Edit Profile')
        click_link('Edit Profile')
      end

      expect(current_path).to eq(edit_user_path(user.id))
    end
  end

  describe 'Create dog' do
    it 'has a link to create a dog' do
      expect(page).to have_link('Add new dog')
      expect(current_path).to eq(new_dog_path)
    end
  end
end
