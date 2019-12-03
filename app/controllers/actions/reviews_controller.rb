class ReviewsController < ApplicationController
  # before_action :authenticate_user
    def index
      reviews = Review.all
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
    def authenticate_user
      jwt = request.headers[:token]
      id = decode(jwt)
      current_user = User.find_by(id: id['user_id']) 
    end
    def review_params
      params.require(:review).permit(:reviewer_id, :reviewed_id, 
        :content, :username)
    end
  end