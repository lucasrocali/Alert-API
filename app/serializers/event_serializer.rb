class EventSerializer < ActiveModel::Serializer
  attributes :id, :importance, :comment

  has_one :location
  has_one :category
end
