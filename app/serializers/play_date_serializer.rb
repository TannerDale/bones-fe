class PlayDateSerializer
  class << self
    def serialize(data)
      {
        object: {
          date: data[:date],
          time: data[:time],
          creator_dog_id: data[:creator_dog_id],
          location_id: data[:location_id],
          invited_dog_id: data[:invited_dog_id]
        },
        token: data[:token],
        email: data[:email]
      }.to_json
    end
  end
end
