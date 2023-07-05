class FavoriteSerializer < ActiveModel::Serializer
  attributes :id


  belongs_to :buyer
  belongs_to :property

  belongs_to :property, serializer: PropertySerializer

end
