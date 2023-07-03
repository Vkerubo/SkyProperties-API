class Property < ApplicationRecord
  belongs_to :seller
  has_many :favorites
end
