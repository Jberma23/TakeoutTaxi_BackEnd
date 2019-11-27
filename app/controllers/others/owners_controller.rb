class OwnersController < ApplicationController
    # before_action :authenticate_user!
    def index 
        owners = User.all.select{|u| u.owner? == true}
        render json: owners
    end
    def show 
        @owner = User.find_by(id: params[:id])
        render json: owner
    end
    def new 
        @owner = Owner.new
    end
    def create 
        @owner = Owner.create(owner_params)
    end
    def update 
        @owner = Owner.update(owner_params)
       
    end
    def destroy 
        Owner.find_by(id: params[:id]).delete
    end

    private
    def owner_params
        params.require(:owner).permit(:firstName, :lastName, :email, :username, :password, )
    end
end
