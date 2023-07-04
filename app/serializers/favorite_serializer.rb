class FavoriteSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :property, serializer: PropertySerializer
end
