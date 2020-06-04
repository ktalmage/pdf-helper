class InvestmentsController < ApplicationController
    before_action :authorized
    
    def index
        set_client_inv
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
        set_investment
        if params[:client_id]
           @client = Client.find_by_id(params[:client_id])

        end
    end

    def new
        if params[:client_id]
        set_client_inv  
        @investment = @client.investments.build
        else
            @investment = Investment.new
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
        set_investment
        if @investment
            render "edit"
        else
            redirect_to @investment
        end
    end

    def update
      if params[:client_id]
        set_client_inv
        @investment.update(investment_params)
        if @investment.errors.any?
            render :edit
        else
            if @investment.valid?
            @investment.save
            redirect_to client_investment_path(@client,@investment)
            
        else
            flash[:alert] =  "You do not have access to this. Please login"
            redirect_to :login
                end
            end
        end
    end
        
    def destroy
        set_client_investment
        @investment.destroy
        flash[:notice] = "Investment deleted."
        redirect_to client_investment_path(@client, @investment)
    end

    private

    def set_user
        @user = User.find_by_id(params[:user_id])
    end

    def set_investment
        @investment = Investment.find_by_id(params[:id])
    end

    def set_client_inv
       @client = Client.find_by_id(params[:client_id])
    end

    def investment_params
        params.require(:investment).permit(:name,:ein,:ordinary_income,:interest_income,:st_capital,:mt_capital,:lt_capital)
    end
end
