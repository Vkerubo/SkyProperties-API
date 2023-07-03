class Seller < ApplicationRecord
    validates :name, presence: true
    validates  :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates  :phone, presence: true, length: {is: 10}
    has_many :properties
end
