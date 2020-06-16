class InvestmentsController < ApplicationController
    before_action :authorized
    before_action :set_investment, only: [:show, :edit, :update, :destroy]
    before_action :set_client_inv, only: [:index, :new, :edit, :update, :destroy]
    
    def index
        if current_user.clients.include?(@client)
           if params[:client_id]
                @investments = @client.investments
            else
                @investments = Investment.all
            
            end
        else
            redirect_to '/welcome'
        end
    end

    def show
        if inv_auth
            set_client_inv
            render :show
        else
            redirect_to '/welcome'
        end
    end

    def new
        
        if current_user.clients.include?(@client)
            if params[:client_id]
                  @investment = @client.investments.build
            else
                @investment = Investment.new
            end
        else
            redirect_to '/welcome'
        end
    end

    def create
        if params[:client_id]
            @investment = Investment.new(investment_params)
            @investment.user = current_user
            @investment.client_id = params[:client_id]
            if @investment.save
             redirect_to client_investment_path(params[:client_id],@investment)
            else
            render :new
            end
        else
            @investment = Investment.new
            if @investment.save
                redirect_to @investment
            else
                render :new
            end
        end
    end
    
    def edit
        if inv_auth
           render "edit"
        else
            redirect_to '/welcome'
        end
    end

    def update
        
        if inv_auth
            @investment.update(investment_params)
            if @investment.save
                redirect_to client_investments_path(@client, @investments)
            else
                render 'edit'
            end
        else
            redirect_to '/welcome'
        end
    end
        
    def destroy
        @investment.destroy
        flash[:notice] = "Investment deleted."
        redirect_to client_investments_path(@client, @investments)
    end

    def reportables
       @investments = current_user.investments.reportable_loss
    end

    private

    def set_investment
        @investment = Investment.find_by_id(params[:id])
    end

    def set_client_inv
       @client = Client.find_by_id(params[:client_id])
    end

    def investment_params
        params.require(:investment).permit(:name,:ein,:ordinary_income,:interest_income,
        :st_capital,:mt_capital,:lt_capital)
    end

    def inv_auth
        params[:client_id] && current_user.investments.include?(@investment)
    end
end
