class Property < ApplicationRecord

  validates :title, :address, :price, :image, :bedrooms, :bathrooms, presence: true

  belongs_to :seller
  has_many :favorites, dependent: :destroy
  has_many :buyers, through: :favorites
end
