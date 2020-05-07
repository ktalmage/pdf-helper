class InvestmentsController < ApplicationController
    def show
        @investment = Investment.find(params[:id])
    end

    def index
        @investments = Investment.long_names
    end

    def new
        @investment = Investment.new
    end

    def create
        @investment = Investment.new(investment_params)
        @investment.save
        
    end

    def update
    end
    
    def destroy
    end

    private

    def investment_params
        params.require(:investment).permit(:name,:ein,:ordinary_income,:interest_income,
            :st_capital,:mt_capital,:lt_capital,:user_id, :client_id,:file)
    end
end