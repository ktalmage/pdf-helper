class Pdf < ApplicationRecord
    belongs_to :user
    has_one_attached :pdf
    validates :name, presence: true # Make sure the owner's name is present.
end
