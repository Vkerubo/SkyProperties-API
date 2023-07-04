class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :phone, :role
end
