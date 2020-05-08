class Investment < ApplicationRecord
    validates :name, uniqueness: true
    validates :ordinary_income, numericality: true
    validates :interest_income, numericality: true
    validates :st_capital, numericality: true
    validates :mt_capital,numericality: true 
    validates :lt_capital, numericality: true
    validates_presence_of :ordinary_income
    validates_presence_of :interest_income
    validates_presence_of :st_capital
    validates_presence_of :mt_capital
    validates_presence_of :lt_capital
    
    has_one_attached :file
    belongs_to :client
    belongs_to :user

    scope :ein_count, -> {where ("COUNT(EIN) == 9")}
    # scope :total_income, -> 

    include Rails.application.routes.url_helpers

    def total
    Investment.all.where(:id => self.id).pluck(:ordinary_income, :interest_income,:st_capital, :mt_capital, :lt_capital).map(&:sum).sum
    end

    
    # def my_url
    #     rails_blob_path(@investment.file, disposition: "attachment")
    # end
    
end
