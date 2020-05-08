class User < ApplicationRecord
    has_one_attached :file
    has_secure_password
    validates_presence_of :email, :password, :name
    validates :email, uniqueness: true
    validates :password, confirmation: true, unless: -> { password.blank? }
    has_many :clients, through: :investments
end
