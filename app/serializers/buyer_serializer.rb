class BuyerSerializer < ActiveModel::Serializer
  attributes :name, :email, :phone
  
  has_many :properties, through: :favorites 
end
