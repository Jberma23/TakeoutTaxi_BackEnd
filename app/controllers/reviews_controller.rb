class ReviewsController < ApplicationController
    def index
      reviews = Review.all
      render json: reviews
    end
  
    def new
      review = Review.find_by(parmas[:id])
    end
  
    def create
      review = Review.create(review_params)
    end
    
    def update
      @review = Review.update(review_params)
      @review.save
    end
    def destory
      Review.find_by(parmas[:id]).delete()
    end
  
  
    private 
    def rating_params
      params.require(:review).permit(:user_id, :truck_id, 
        :content)
    end
  end