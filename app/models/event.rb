class Event < ApplicationRecord
  belongs_to :location
  belongs_to :category
end
