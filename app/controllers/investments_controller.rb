class InvestmentsController < ApplicationController
    before_action :set_investment, only: [:show, :edit, :update, :destroy]
    def show
    end

    def index
        @investments = Investment.all
    end

    def new
        @investment = Investment.new
    end

    def create
        @investment = Investment.new(investment_params)
        if current_user
            @investment.save
            redirect_to investments_path
        else
            
            
        end
    end

    def edit
    end

    def update
        @investment.update(investment_params)
        if current_user
            @investment.save
          redirect_to investments_path
        else
            flash[:alert] =  "You do not have access to this. Please login"
            redirect_to :login
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