class Property < ApplicationRecord
  belongs_to :seller
  has_many :favorites
  has_many :buyers, through: :favorites
end
