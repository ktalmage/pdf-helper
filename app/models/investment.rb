class Investment < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :client, dependent: :destroy
    validates :name, uniqueness: true
    validates :ein, uniqueness: true, length: {is: 9}
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
    
    scope :reportable_loss, -> { where("ordinary_income >= -2000000") }

    def total
    Investment.all.where(:id => self.id).pluck(:ordinary_income, :interest_income,:st_capital, :mt_capital, :lt_capital).map(&:sum).sum
    end

    def self.footed
        self.all.sum do |inv|
            inv.total
        end
    end

  
end
        
    

    
    # def my_url
    #     rails_blob_path(@investment.file, disposition: "attachment")
    # end
    

