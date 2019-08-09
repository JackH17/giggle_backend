class User < ApplicationRecord
    has_secure_password
    has_many :groups
    has_many :discussions, through: :groups
    accepts_nested_attributes_for :groups

    
end
