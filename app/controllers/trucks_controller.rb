class TrucksController < ApplicationController
    # before_action :authenticate_user
    
    
    def index
        # jwt = request.headers[:token]
        # id = decode(jwt)
        # current_user = User.find_by(id: id['user_id'])        
        # if current_user != nil && current_user.role == "customer"
        # trucks = Truck.all
        # render json: trucks.to_json( 
        # include: [:favorites, :ratings, :reviews])
        # elsif current_user != nil && current_user.role == "owner" 
        # trucks = current_user.trucks
        # render json: trucks.to_json( 
        # include: [:favorites, :ratings, :reviews])
        # else
            trucks = Truck.all.first(10)
            render json: trucks.to_json( 
            include: [:favorites, :ratings, :reviews])
        # end
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
    def authenticate_user
        jwt = request.headers[:token]
        id = decode(jwt)
        current_user = User.find_by(id: id['user_id']) 
      end
end
