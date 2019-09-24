class FavoritesController < ApplicationController
  def index
    favorites = Favorite.all
    render json: favorites
  end

  def new
    favorite = Favorite.find_by(parmas[:id])
  end

  def create
    favorite = Favorite.create(favorite_params)
  end
  
  def update
    @favorite = Favorite.update(favorite_params)
    @favorite.save
  end
  def destory
    Favorite.find_by(parmas[:id]).delete()
  end


  private 
  def favorite_params
    params.require(:favorite).permit(:user_id, :truck_id)
  end
end
