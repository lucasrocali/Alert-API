class Location < ApplicationRecord
  belongs_to :user
  has_one :event
  has_one :notification

  validates_presence_of :lat, :lon

	acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lon
end
