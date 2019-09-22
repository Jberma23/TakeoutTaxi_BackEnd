class CustomersController < ApplicationController
    before_action :authenticate_user!
  
    def index 
        customers = User.all.select{|u| u.customer? == true}
        render json: customers
    end
    def show 
        customer = User.find_by(params[:id])
        render json: customer
    end
    def new 
        @customer = Customer.new
    end
    # def create 
    #     @customer = Customer.create(customer_params)
    # end
    def update 
        @customer = Customer.update(customer_params)
        @customer.save
    end
    def destroy 
        Customer.find_by(params[:id]).delete()
    end

    private
    def customer_params
        params.require(:customer).permit(:firstName, :lastName, :email, :username, :password, )
    end
end
