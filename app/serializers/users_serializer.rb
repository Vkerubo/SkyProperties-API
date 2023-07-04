class UsersSerializer < ActiveModel::Serializer
  attributes :username, :email, :phone, :role
end
