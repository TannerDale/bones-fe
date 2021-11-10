require 'rails_helper'

describe 'Dogs New Page', :vcr do
  let(:user) { create :user }
  let(:dog) { build :dog_poro }
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_dog_path
  end

  it 'has a form to add pet information' do
    fill_in 'Name', with: dog.name
    fill_in 'Age', with: dog.age
    fill_in 'Breed', with: dog.breed
    select dog.size, from: 'Size'
    fill_in 'Sex', with: dog.sex
    select 'yes', from: 'Vaccinated'
    select 'yes', from: 'Trained'
    click_button 'Add Dog'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Dog Created')
  end
end
