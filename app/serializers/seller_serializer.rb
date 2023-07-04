class SellerSerializer < ActiveModel::Serializer
  attributes :name, :email, :phone
  has_many :properties
end
