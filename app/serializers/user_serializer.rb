class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :auth_token

  has_one :user_info
  has_many :category_preferences
  has_many :tag_preferences
  has_many :locations
end
