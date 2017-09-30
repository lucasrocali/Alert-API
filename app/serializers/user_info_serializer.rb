class UserInfoSerializer < ActiveModel::Serializer
  attributes :id, :name, :birthday, :address
end
