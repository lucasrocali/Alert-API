class Event < ApplicationRecord
  belongs_to :location
  belongs_to :category
  has_many :event_tags, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :strengths, dependent: :destroy
end
