class Favorite < ApplicationRecord
  belongs_to :buyer
  belongs_to :property
end
