class Location < ApplicationRecord
  belongs_to :user
  has_one :event, dependent: :destroy
  has_one :notification, dependent: :destroy
end
