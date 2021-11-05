class LocationSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :address, :phone, :rating
end
