class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email, :password, :name
    validates :email, uniqueness: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    has_many :investments, inverse_of: :client
    has_many :clients, through: :investments
    
    def self.find_or_create_by_omniauth(auth_hash)
        self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
            user.password = SecureRandom.hex
            user.password_confirmation == user.password
        end
    end

    
        
end
