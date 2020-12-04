class Client < ApplicationRecord
    validates :name, uniqueness: true
    validates :ein, uniqueness: true, length: {is: 9}
    has_many :investments, dependent: :destroy
    has_many :users, through: :investments


    def self.search(search)
        where("LOWER(clients.name) LIKE :search", search: "%#{search.downcase}%")
    end

   
end