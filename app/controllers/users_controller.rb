class UsersController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show, :create, :new]
    def index 
        users = User.all
        render json: users
        if user_signed_in?
            render json: current_user
        end
    end
    def is_signed_in?

        if user_signed_in?
          render :json => {"signed_in" => true, "user" => current_user}.to_json()
        else
          render :json => {"signed_in" => false}.to_json()
        end
     
    
    end
    def show 
        token = request.headers["Authentication"].split(" ")[1]
        render json: User.find(decode(token)["user_id"]), status: :accepted
    end
    def new 
        @user = User.new
    end
    def create 
        user = User.create(user_params)
        render json: user
        
    end
    def update 
        @user = User.update(user_params)
        @user.save
    end
    def destroy 
        User.find_by(params[:id]).delete()
    end

    private
    def user_params
        params.require(:user).permit(:firstName, :lastName, :role, :email, :username, :password, )
    end
end
