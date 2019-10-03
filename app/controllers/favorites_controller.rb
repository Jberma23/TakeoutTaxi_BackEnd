class FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
    render json: favorites
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
  def favorite_params
    params.require(:favorite).permit(:favoriter_id, :favorited_id)
  end
end
