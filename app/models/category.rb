class Category < ApplicationRecord
  belongs_to :api_user
  belongs_to :category, optional: true
  has_many :categories
  has_many :category_preferences
  has_many :events

  validates_presence_of :name
end
