class TrucksController < ApplicationController
    before_action :authenticate_user!
    def index 
        trucks = Truck.all
        render json: trucks
    end
    def show 
        @truck = Truck.find_by(params[:id])
    end
    def new 
        @truck = Truck.new
    end
    def create 
        @truck = Truck.create(truck_params)
    end
    def update 
        @truck = Truck.update(truck_params)
        @truck.save
    end
    def destroy 
        Truck.find_by(params[:id]).delete()
    end

    private
    def truck_params
        params.require(:truck).permit(:name, :owner_id, :image_url, :url, :review_count, :rating, :latitude, :longitude, :price, :display_location )
    end
end
