class Buyer < ApplicationRecord
    validates :name, :email, :phone, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :phone, presence: true, length: {is: 10}
    has_many :favorites
    has_many :properties, through: :favorites
end
