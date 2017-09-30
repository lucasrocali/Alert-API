class Tag < ApplicationRecord
  belongs_to :tag, optional: true
  has_many :tags, dependent: :destroy
  has_many :event_tags, dependent: :destroy
end
