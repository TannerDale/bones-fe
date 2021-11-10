require 'rails_helper'

RSpec.describe "playdate#show" do
  before :each do

  end
  it 'displays playdate attributes' do
    expect(page).to have_content(location.name)
  end
end
