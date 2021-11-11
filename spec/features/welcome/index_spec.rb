require 'rails_helper'

RSpec.describe 'Welcome Index', :vcr do
  before :each do
    visit root_path
  end

  describe 'logging in' do
    it 'has a link to log in' do
      expect(page).to have_button('Sign In with Google')
      expect(page).to_not have_button('Sign Out with Google')
    end

    it 'allows you to login' do
      login_with_oauth

      expect(current_path).to eq(dashboard_path)
    end

    it 'does not display login page if logged in' do
      login_with_oauth
      visit root_path

      expect(page).to_not have_content('Sign In with Google')
    end
  end

  describe 'do not have access to other pages unless logged in' do
    it 'redirects to root path' do
      visit dashboard_path

      expect(current_path).to eq(root_path)
    end
  end
end
