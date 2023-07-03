class User < ApplicationRecord
    belongs_to :buyer
    belongs_to :seller
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :role, presence: true
    validates :phone, presence: true, length: {is: 10}
    validates :password, length: {in: 6..15}
    validates :buyer_id, uniqueness: true, allow_nil: true
    validates :seller_id, uniqueness: true, allow_nil: true
end
