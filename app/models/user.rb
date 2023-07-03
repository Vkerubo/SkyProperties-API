class User < ApplicationRecord
    belongs_to :buyer
    belongs_to :seller
    has_secure_password

end
