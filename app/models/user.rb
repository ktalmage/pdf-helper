class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email, :password, :name
    validates :email, uniqueness: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    has_many :investments
    has_many :clients, through: :investments
    accepts_nested_attributes_for :clients
end
