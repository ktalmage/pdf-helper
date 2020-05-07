class InvestmentsController < ApplicationController
    before_action :set_investment, only: [:show, :edit, :destroy]
    def show
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

    def edit
    end

    def update
        @investment.update(investment_params)
        if @investment.save
          redirect_to @investment
        else
          render :edit
        end
      end
    
    
    def destroy
        @investment.destroy
        flash[:notice] = "Investment deleted."
        redirect_to investments_path
    end

    private

    def set_investment
        @investment = Investment.find(params[:id])
    end

    def investment_params
        params.require(:investment).permit(:name,:ein,:ordinary_income,:interest_income,:st_capital,:mt_capital,:lt_capital,:user_id,:client_id,:file)
    end
end