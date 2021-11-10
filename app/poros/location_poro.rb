class LocationPoro
  attr_reader :id, :name, :address, :phone, :rating

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @rating = data[:rating]
    @categories = data[:categories]
  end
end
