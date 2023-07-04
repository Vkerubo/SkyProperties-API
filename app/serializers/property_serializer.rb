class PropertySerializer < ActiveModel::Serializer
  attributes :id, :title, :address, :price, :image, :bedrooms, :bathrooms

  belongs_to :seller
end
