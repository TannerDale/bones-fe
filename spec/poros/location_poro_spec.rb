require 'rails_helper'

describe LocationPoro do
  let(:data) do
    {
      id: 1,
      name: "Mugele's Pizza",
      address: '500 Deadmau5 Dr Bruh',
      phone: '303-505-5555',
      rating: 4.9
    }
  end
  let(:location) { LocationPoro.new(data) }

  it "exists" do
    expect(location).to be_a LocationPoro
  end

  it "has attributes" do
    expect(location.id).to eq(1)
    expect(location.name).to eq("Mugele's Pizza")
    expect(location.address).to eq('500 Deadmau5 Dr Bruh')
    expect(location.phone).to eq('303-505-5555')
    expect(location.rating).to eq(4.9)
  end
end
