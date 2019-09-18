class TrucksController < ApplicationController
    def index 
        trucks = Truck.all
        render json: trucks
    end
    def show 
        @truck = Truck.find_by(params[:id])
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
