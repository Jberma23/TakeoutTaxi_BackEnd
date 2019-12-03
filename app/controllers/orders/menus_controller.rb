class MenusController < ApplicationController
    before_action :authenticate_user
    def index 
        menus = Menu.all
        render json: menus
    end
    def show 
        menu = Menu.find_by(id: params[:id])
        render json: menu
    end
    def new 
        @menu = Menu.new
    end
    def create 
        @menu = Menu.create(menu_params)
        render json: @menu
    end
    def update 
        @menu = Menu.update(menu_params)
        @menu.save
    end
    def destroy 
        Menu.find_by(id: params[:id]).delete
    end

    private
    # def authenticate_user
    #     jwt = request.headers[:token]
    #     id = decode(jwt)
    #     current_user = User.find_by(id: id['user_id']) 
    #   end
    def menu_params
        params.require(:menu).permit(:truck_id, :name)
    end
end
