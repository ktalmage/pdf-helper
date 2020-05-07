class Investment < ApplicationRecord
    has_one_attached :file
    belongs_to :client
    belongs_to :user

    include Rails.application.routes.url_helpers

    def my_url
        rails_blob_path(@investment.file, disposition: "attachment")
    end
    
end
