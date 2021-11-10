require 'rails_helper'

describe DogFactFacade, :vcr do
  it "can get a dog fact" do
    result = DogFactFacade.get_fact
    expect(result).to be_a String
  end
end
