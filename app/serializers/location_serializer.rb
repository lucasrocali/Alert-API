class LocationSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lon
end
