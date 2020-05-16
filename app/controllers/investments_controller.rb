class InvestmentsController < ApplicationController
    before_action :authorized
    before_action :set_investment, only: [:show, :edit, :update, :destroy]
    

    def index
        if params[:client_id]
            @client = Client.find_by_id(params[:client_id])
            @investments = @client.investments
        else
            @investments = Investment.all
        end
    end

    def show
        set_investment
        if params[:client_id]
           
            @client = Client.find_by_id(params[:client_id])
        end
    end

    def new
        if params[:client_id]
         set_client_inv
         @investment = @user.investments.build
        else
            @investment = Investment.new
        end
    end

    def create
        if params[:client_id]
            set_client_inv
        @investment = @client.investments.build(investment_params)
        else
            @investment = Investment.new(investment_params)
        end
        if @investment.save
            redirect_to @investment
        else
            render :new, alert: "Error creating investment"
        end
    end

    def edit
    end

    def update
        @investment.update(investment_params)
        if @investment.errors.any?
            render :edit
        else
        if @investment.valid?
            @investment.save
          redirect_to investments_path
        else
            flash[:alert] =  "You do not have access to this. Please login"
            redirect_to :login
        end
      end
    end
    
    
    def destroy
        @investment.destroy
        flash[:notice] = "Investment deleted."
        redirect_to investments_path
    end

    private

    

    def set_investment
        @investment = Investment.find_by_id(params[:id])
    end

    def set_client_inv
       @client = Client.find_by_id(params[:id])
    end

    def investment_params
        params.require(:investment).permit(:name,:ein,:ordinary_income,:interest_income,:st_capital,:mt_capital,:lt_capital,:user_id,:client_id)
    end
end