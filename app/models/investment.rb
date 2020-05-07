class Investment < ApplicationRecord
    has_one_attached :file
    belongs_to :client
    belongs_to :user

    scope :long_names, -> {where ("LENGTH(name) > 10")}

    include Rails.application.routes.url_helpers

    def my_url
        rails_blob_path(@investment.file, disposition: "attachment")
    end
    
end
