class MainController < ApplicationController
    def home
        if logged_in?
            flash[:alert]= "You are logged in, please either logout or return to welcome page"
            redirect_to :welcome
        else
            redirect_to 'main#home'
        end
    end
end