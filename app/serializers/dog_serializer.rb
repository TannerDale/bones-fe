class DogSerializer
  include JSONAPI::Serializer

  attributes :name, :age, :breed, :sex, :trained, :vaccinated, :user_id, :description, :size
end
