class CurrentUserController < ApplicationController
    before_action :authenicate_user, only: [:show]
    def show 
        byebug
    end 
end
