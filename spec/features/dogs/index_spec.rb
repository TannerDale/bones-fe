require 'rails_helper'

describe 'Dogs Index', :vcr do
  let!(:dogs) { build_list :dog_poro, 40 }
  let(:user) { create :user }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow(DogFacade).to receive(:dogs).and_return(dogs)

    visit dogs_path
  end

  it 'has all the dogs', js: true do
    dogs[..19].each do |dog|
      expect(page).to have_content(dog.name)
      expect(page).to have_content(dog.age)
      expect(page).to have_content(dog.breed)
      expect(page).to have_content(dog.size)
      expect(page).to have_content(dog.sex)
      expect(page).to have_content(dog.trained)
      expect(page).to have_content(dog.vaccinated)
      expect(page).to have_link("Schedule Playdate with #{dog.name}")
    end
  end

  it 'does not have previous page button on page 1', js: true do
    expect(page).not_to have_button 'Previous Page'
  end

  it 'can change pages', js: true do
    click_on 'Next Page'
    expect(page).to have_content 'Page: 2'

    click_button 'Previous Page'
    expect(page).to have_content 'Page: 1'
  end
end
