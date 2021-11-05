class PlayDateSerializer
  include JSONAPI::Serializer

  attributes :date, :time, :creator_dog_id, :location_id, :invited_dog_id
end
