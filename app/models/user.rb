class User < ApplicationRecord
    belongs_to :buyer, optional: true
    belongs_to :seller, optional: true
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :role, presence: true
    validates :phone, presence: true, length: {is: 10}
    validates :buyer_id, uniqueness: true, allow_nil: true
    validates :seller_id, uniqueness: true, allow_nil: true
end
