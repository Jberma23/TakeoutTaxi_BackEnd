class OwnersController < ApplicationController
    def index 
        @owners = Owner.all
    end
    def show 
        @owner = Owner.find_by(params[:id])
    end
    def new 
    end
    def create 
    end
    def update 
    end
    def destroy 
    end
end
