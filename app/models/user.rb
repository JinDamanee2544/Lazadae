class User < ApplicationRecord
    has_secure_password
    
    has_many :inventories
    has_many :markets
end
