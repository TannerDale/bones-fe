class PlayDateWithDogsPoro
  attr_reader :id, :invited_dog, :creator_dog, :date, :time, :location_id, :invite_status

  def initialize(data)
    @id = data[:id]
    @invited_dog = data[:invited_dog]
    @creator_dog = data[:creator_dog]
    @date = data[:date]
    @time = data[:time]
    @location_id = data[:location_id]
    @invite_status = data[:invite_status]
  end
end
