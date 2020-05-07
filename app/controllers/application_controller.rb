class ApplicationController < ActionController::Base
    before_action :authorized
    # before_action :require_login
    helper_method :current_user
    helper_method :logged_in?

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    # def require_login
    #     unless logged_in?
    #         flash[:error] = "You must be logged in to access this section"
    #         redirect_to '/'
    #     end
    # end

    def authorized
        redirect_to 'welcome' unless logged_in?
    end
end
