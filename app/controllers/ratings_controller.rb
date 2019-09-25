require 'byebug'
class RatingsController < ApplicationController
  def index
    ratings = Rating.all
    render json: ratings
  end
  def show
    rating = Rating.find_by(parmas[:id])
    render json: rating
  end

  def new
    rating = Rating.find_by(parmas[:id])
  end

  def create
    rating = Rating.create!(rating_params)
    render json: rating
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
    params.require(:rating).permit(:rater_id, :rated_id, :score)
  end
end