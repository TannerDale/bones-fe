require 'rails_helper'

describe 'Dogs New Page', :vcr do
  let(:user) { User.create!(name: 'a', email: 'b', token: 'c', google_id: 'd') }
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_dog_path
  end

  it 'has a form to add pet information' do
    fill_in 'Name', with: 'Chuck'
    fill_in 'Age', with: 11
    fill_in 'Breed', with: 'great dane'
    fill_in 'Size', with: 'large'
    fill_in 'Sex', with: 'male'
    check 'vaccinated'
    check 'trained'
    click_button 'Add Dog'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Dog Created')
  end
end
