class Event < ApplicationRecord
  attr_accessor :user_id, :lat, :lon, :tag_ids

  belongs_to :location
  belongs_to :category
  has_many :event_tags
  has_many :notifications
  has_many :strengths

  validates_presence_of :importance

  before_validation :manage_location

  after_create :set_event_tags

  private
    def manage_location
    	if user_id.present? && lat.present? && lon.present?
      		location = Location.create!(user_id: user_id, lat: lat, lon: lon)
      		self.location_id = location.id
      	end
    end

    def set_event_tags
      if tag_ids.present?
        tag_ids.each do |tag_id|
          EventTag.create!(event_id: self.id, tag_id: tag_id)
        end
      end
    end
end
