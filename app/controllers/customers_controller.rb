class CustomersController < ApplicationController
    def index 
        @customers = Customer.all
    end
    def show 
        @customer = Customer.find_by(params[:id])
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
