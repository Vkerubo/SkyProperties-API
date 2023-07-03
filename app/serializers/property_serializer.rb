class PropertySerializer < ActiveModel::Serializer
  attributes :id, :title, :address, :price, :image, :bedrooms, :bathrooms
end
