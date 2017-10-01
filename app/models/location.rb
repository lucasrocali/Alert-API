class Location < ApplicationRecord
  belongs_to :user
  has_one :event
  has_one :notification

  validates_presence_of :lat, :lon

end
