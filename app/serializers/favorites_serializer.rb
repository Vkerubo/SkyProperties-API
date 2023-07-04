class FavoritesSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :buyer
  belongs_to :property
end
