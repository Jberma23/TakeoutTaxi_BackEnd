class CategoriesController < ApplicationController
    # before_action :authenticate_user
    def index 
        categories = Category.all
        render json: categories
    end
    def show 
        category = Category.find_by(id: params[:id])
        render json: category
    end
    def new 
        @category = Category.new
    end
    def create 
        @category = Category.create(category_params)
        render json: @category
    end
    def update 
        @category = Category.update(category_params)
        @category.save
    end
    def destroy 
        Category.find_by(id: params[:id]).delete
    end

    private
    # def authenticate_user
    #     jwt = request.headers[:token]
    #     id = decode(jwt)
    #     current_user = User.find_by(id: id['user_id']) 
    #   end
    def category_params
        params.require(:category).permit(:menu_id, :name)
    end
end
