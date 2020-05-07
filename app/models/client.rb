class Client < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    has_many :investments
    has_many :users, through: :investments
    acccepts_nested_attributes_for :investments
end
