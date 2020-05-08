class Investment < ApplicationRecord
    has_one_attached :file
    belongs_to :client
    belongs_to :user

    scope :ein_count, -> {where ("COUNT(EIN) == 9")}
    # scope :total_income, -> 

    include Rails.application.routes.url_helpers

    def total
        Investment.where(:id=>self.id).pluck("SUM(ordinary_income)","SUM(interest_income)").to_s
    end

    # def my_url
    #     rails_blob_path(@investment.file, disposition: "attachment")
    # end
    
end
