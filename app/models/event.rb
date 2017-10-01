class Event < ApplicationRecord
  attr_accessor :user_id, :lat, :lon

  belongs_to :location
  belongs_to :category
  has_many :event_tags
  has_many :notifications
  has_many :strengths

  validates_presence_of :importance

  before_validation :manage_location

  private
    def manage_location
    	if user_id.present? && lat.present? && lon.present?
      		location = Location.create!(user_id: user_id, lat: lat, lon: lon)
      		self.location_id = location.id
      	end
    end
end
