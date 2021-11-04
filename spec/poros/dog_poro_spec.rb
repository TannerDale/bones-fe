require 'rails_helper'

describe DogPoro do
  let(:data) do
    {
      id: 1,
      attributes: {
        name: 'a',
        size: 'medium',
        age: 1,
        breed: 'b',
        vaccinated: 'true',
        sex: 'male',
        trained: 'yes',
        user_id: 3
      }
    }
  end
  let(:dog) { DogPoro.new(data) }

  it 'exists' do
    expect(dog).to be_a DogPoro
  end

  it 'has attributes' do
    expect(dog.name).to eq('a')
    expect(dog.size).to eq('medium')
    expect(dog.age).to eq(1)
    expect(dog.breed).to eq('b')
    expect(dog.vaccinated).to eq('true')
    expect(dog.trained).to eq('yes')
    expect(dog.sex).to eq('male')
    expect(dog.user_id).to eq(3)
  end
end
