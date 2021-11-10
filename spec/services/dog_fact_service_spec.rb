require 'rails_helper'

RSpec.describe 'DogFactService', :vcr do
  it "can get a dog fact" do
    result = DogFactService.get_fact
    expect(result).to be_a String
  end
end
