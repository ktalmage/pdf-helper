class MainController < ApplicationController
    skip_before_action :authorized, only: [:home]
    def home
        redirect_to welcome_path
    end
end