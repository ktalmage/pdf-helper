class Investment < ApplicationRecord

    require 'pdf-reader'
    require 'open-uri'
    require 'pry'
    
    belongs_to :user
    belongs_to :client
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
    
    scope :reportable_loss, -> { where("ordinary_income <= -2000000") }

    def total
        Investment.all.where(:id => self.id).pluck(:ordinary_income, :interest_income,:st_capital, 
            :mt_capital, :lt_capital).map(&:sum).sum
    end

    def self.footed
        self.all.sum do |inv|
            inv.total
        end
    end

    def self.get_inv_data
            io = open('https://s23.q4cdn.com/714267708/files/doc_downloads/PTP_307111_SAMPLEPARTNERA_K1_2018_FED.PDF')
            receiver = PDF::Reader::RegisterReceiver.new
            
            reader = PDF::Reader.new(io)
            reader.pages.each do |page|
            if page.number == 5
                page.walk(receiver)
                receiver.callbacks.each do |cb|
                   
                    if cb.values.to_s =="show_text"
                       
                    cb[:args]
                       
                    end
                end
            end
        end
    end

   

end
        
    

    

