class DogSerializer
  include JSONAPI::Serializer

  attributes :name, :age, :breed, :sex, :size, :trained, :vaccinated, :user_id
end
