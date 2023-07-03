class Buyer < ApplicationRecord
    validates :name, :email, :phone, presence: true
    
    has_many :favorites
    has_many :properties, through: :favorites
end
