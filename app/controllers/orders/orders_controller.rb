class OrdersController < ApplicationController
    before_action :authenticate_user
    def index 
        orders = Order.all
        render json: orders
    end
    def show 
        order = Order.find_by(id: params[:id])
        render json: order
    end
    def new 
        @order = Order.new
    end
    def create 
        @order = Order.create(order_params)
    end
    def update 
        @order = Order.update(order_params)
        @order.save
    end
    def destroy 
        Order.find_by(id: params[:id]).delete
    end

    private
    def authenticate_user
        jwt = request.headers[:token]
        id = decode(jwt)
        current_user = User.find_by(id: id['user_id']) 
      end
    def order_params
        params.require(:order).permit(:seller_id, :purchaser_id)
    end
end
