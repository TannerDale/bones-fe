require 'rails_helper'

describe 'User Edit', :vcr do
  let(:user) { create :user }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_path(user.id)
  end

  describe 'Edit Profile information' do
    it 'has a form to edit user profile' do
      expect(page).to have_field('location')
      fill_in 'location', with: 'Denver, CO'
      click_button 'Update Profile'

      expect(current_path).to eq(dashboard_path)
      expect(user.location).to eq('Denver, CO')
    end
  end
end
