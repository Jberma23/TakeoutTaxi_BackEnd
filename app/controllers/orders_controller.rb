class OrdersController < ApplicationController
    def index 
        @orders = Order.all
    end
    def show 
        @order = Order.find_by(params[:id])
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
