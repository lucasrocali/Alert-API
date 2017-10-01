class Tag < ApplicationRecord
  belongs_to :api_user
  belongs_to :tag, optional: true
  has_many :tags
  has_many :event_tags

  validates_presence_of :name
end
