class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :phone, :role, :seller_id, :buyer_id
end

