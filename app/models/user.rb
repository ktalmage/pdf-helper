class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email, :password, :name
    validates :email, uniqueness: true
end
