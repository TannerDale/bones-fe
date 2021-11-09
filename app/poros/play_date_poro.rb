class PlayDatePoro
  attr_reader :invited_dog_id, :creator_dog_id, :date, :time, :location_id, :invite_status

  def initialize(data)
    @invited_dog_id = data[:invited_dog_id]
    @creator_dog_id = data[:creator_dog_id]
    @date = data[:date]
    @time = data[:time]
    @location_id = data[:location_id]
    @invite_status = data[:invite_status]
  end
end
