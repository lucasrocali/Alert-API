class CategorySerializer < ActiveModel::Serializer
  attributes :id, :category_id, :name, :image_url

  has_many :categories
end
