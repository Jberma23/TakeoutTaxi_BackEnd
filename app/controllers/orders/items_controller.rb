class ItemsController < ApplicationController
    # before_action :authenticate_user
    def index 
        items = Item.all
        render json: items
    end
    def show 
        item = Item.find_by(id: params[:id])
        render json: item
    end
    def new 
        @item = Item.new
    end
    def create 
        @item = Item.create(item_params)
        render json: @item
    end
    def update 
        @item = Item.update(item_params)
        @item.save
    end
    def destroy 
        Item.find_by(id: params[:id]).delete
    end

    private
    # def authenticate_user
    #     jwt = request.headers[:token]
    #     id = decode(jwt)
    #     current_user = User.find_by(id: id['user_id']) 
    #   end
    def item_params
        params.require(:item).permit(:category_id, :name, :description, :ingredients, :price)
    end
end
