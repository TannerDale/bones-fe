class DogPoro
  attr_reader :id, :name, :breed, :size, :age, :vaccinated, :trained, :user_id, :sex

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @breed = data[:attributes][:breed]
    @size = data[:attributes][:size]
    @age = data[:attributes][:age]
    @vaccinated = data[:attributes][:vaccinated]
    @trained = data[:attributes][:trained]
    @sex = data[:attributes][:sex]
    @user_id = data[:attributes][:user_id]
  end
end
