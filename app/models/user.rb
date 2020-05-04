class User < ApplicationRecord
    has_secure_password
    has_one_attached :pdf
    has_many :pdfs
end
