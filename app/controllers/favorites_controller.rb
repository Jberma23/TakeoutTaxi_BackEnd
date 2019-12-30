class FavoritesController < ApplicationController
  before_action :authenticate
  def index
    jwt = request.headers[:token]
      if jwt 
      id = decode(jwt)
      current_user = User.find_by(id: id['user_id']) 
      end
      if current_user != nil && current_user.role == "customer" 
      favorites = current_user.favorites
      render json: favorites
      else
      favorites = Favorite.all
      render json: favorites
      end
  end
  def show
    favorite = Favorite.find_by(params[:id])
    render json: favorite
  end
  def new
    favorite = Favorite.find_by(params[:id])
  end

  def create
    favorite = Favorite.create(favorite_params)
    render json: favorite
  end
  
  def update
    @favorite = Favorite.update(favorite_params)
    @favorite.save
  end
  def destroy
    
    favorite = Favorite.find_by(id: params[:id]).delete
    render json: favorite
  end


  private 
  def authenticate_user
    jwt = request.headers[:token]
    id = decode(jwt)
    current_user = User.find_by(id: id['user_id']) 
  end
  def favorite_params
    params.require(:favorite).permit(:favoriter_id, :favorited_id)
  end
end
