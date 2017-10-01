class EventSerializer < ActiveModel::Serializer
  attributes :id, :importance, :comment

  has_one :location
  has_one :category
  has_many :event_tags
  has_many :notifications
  has_many :strengths
end
