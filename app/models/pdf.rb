class Pdf < ApplicationRecord
    belongs_to :user
    validates :name, presence: true # Make sure the owner's name is present.
end
