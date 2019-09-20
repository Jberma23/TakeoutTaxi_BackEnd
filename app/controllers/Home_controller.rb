class HomeController < ApplicationController

    def index
        
    end
    def show
        user = current_user
        render json: user
    end 
end