require 'byebug'
class ReviewsController < ApplicationController
    def index
      reviews = Review.first(40)
      # render json: reviews
      
      render json: reviews

    end
    def show
      review = Review.find_by(id: params[:id])
      render json: review
    end

  
    def new
      review = Review.find_by(id: params[:id])
    end
  
    def create
      review = Review.create!(review_params)
      render json: review
    end
    
    def update
      review = Review.update(review_params)
      render json: review
    end
    def destory
      Review.find_by(id: params[:id]).delete
    end
  
  
    private 
    def review_params
      params.require(:review).permit(:reviewer_id, :reviewed_id, 
        :content, :username)
    end
  end