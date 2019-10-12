require 'byebug'
class TrucksController < ApplicationController
    before_action :authenticate_user!, only: [:destroy]
    def index 
        
        if current_user != nil && current_user.role == "customer"
        trucks = Truck.all
        render json: trucks.to_json( 
        include: [:favorites, :ratings, :reviews])
        elsif current_user != nil && current_user.role == "owner" 
   
        trucks = Truck.all.select{|truck| truck.owner_id == current_user.id}.last(2)
        render json: trucks.to_json( 
        include: [:favorites, :ratings, :reviews])
        else
       
            trucks = Truck.all.last(2)
            render json: trucks.to_json( 
            include: [:favorites, :ratings, :reviews])
        end
    end
    def show 
        truck = Truck.find_by(id: params[:id])
        render json: truck
    end
   
    def new 
        @truck = Truck.new
    end
    
    def create 
        @truck = Truck.create!(truck_params)
        render json: @truck
    end
    def update 
        truck = Truck.find_by(id: params[:id])
        truck.update(truck_params)
        render json: truck
    end
    def destroy 
        Truck.find_by(id: params[:id]).delete
    end

    private
    def truck_params
        params.require(:truck).permit(:name, :owner_id, :url, :review_count, :rating, :latitude, :longitude, :price, :address, image_url: [] )
    end
end
