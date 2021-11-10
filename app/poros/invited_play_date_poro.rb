class InvitedPlayDatePoro
  attr_reader :id, :invited_dog_id, :creator_dog_id, :date, :time, :location_id

  def initialize(data)
    @id = data[:id]
    @invited_dog_id = data[:relationships][:invited_dog][:data][:id]
    @creator_dog_id = data[:relationships][:creator_dog][:data][:id]
    @date = data[:attributes][:date]
    @time = format_time(data[:attributes][:time])
    @location_id = data[:attributes][:location_id]
  end

  def format_time(data)
    data.scan(/\d\d:\d\d/).first
  end
end
