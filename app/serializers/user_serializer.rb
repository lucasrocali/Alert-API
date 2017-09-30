class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :auth_token

  has_one :user_info
end
