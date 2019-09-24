class RatingsController < ApplicationController
  def index
    ratings = Rating.all
    render json: ratings
  end

  def new
    rating = Rating.find_by(parmas[:id])
  end

  def create
    rating = Rating.create(rating_params)
  end
  
  def update
    @rating = Rating.update(rating_params)
    @rating.save
  end
  def destory
    Rating.find_by(parmas[:id]).delete()
  end


  private 
  def rating_params
    params.require(:rating).permit(:user_id, :truck_id, 
      :rating)
  end
end