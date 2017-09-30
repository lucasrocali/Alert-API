class Category < ApplicationRecord
  belongs_to :api_user, dependent: :destroy
  belongs_to :category, optional: true
  has_many :categories, dependent: :destroy
  has_many :category_preferences, dependent: :destroy
  has_many :events, dependent: :destroy
end
