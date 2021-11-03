require 'rails_helper'

describe 'Dogs New Page' do
  let(:user) { User.create!(name: 'a', email: 'b', token: 'c', google_id: 'd') }
  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_dog_path
  end

  it 'has a form to add pet information' do
    stub_request(:post, "http://localhost:5000/api/v1/dogs")
         .with(
           body: "{\"object\":{\"name\":\"Chuck\",\"age\":\"11\",\"breed\":\"great dane\",\"size\":\"large\",\"sex\":\"male\",\"vaccinated\":\"1\",\"trained\":\"1\",\"user_id\":1},\"options\":{},\"context\":{},\"base_url\":null,\"_fields\":{},\"_include_linkages\":[]}",
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v1.8.0'
           })
         .to_return(status: 200, body: "", headers: {})

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
