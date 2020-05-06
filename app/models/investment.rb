class Investment < ApplicationRecord
    has_one_attached :file
    belongs_to :client
    
end
