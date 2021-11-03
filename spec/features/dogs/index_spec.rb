require 'rails_helper'

describe 'Dogs Index' do
  let!(:dogs) { build_list :dog_poro, 40 }
  let(:user) { create :user }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow(DogFacade).to receive(:dogs).and_return(dogs)

    visit dogs_path
  end

  it 'has all the dogs' do
    dogs[..19].each do |dog|
      expect(page).to have_content(dog.name)
      expect(page).to have_content(dog.age)
      expect(page).to have_content(dog.breed)
      expect(page).to have_content(dog.size)
      expect(page).to have_content(dog.sex)
      expect(page).to have_content(dog.trained)
      expect(page).to have_content(dog.vaccinated)
    end
  end
end
