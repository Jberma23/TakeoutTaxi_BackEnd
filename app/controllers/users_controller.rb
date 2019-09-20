class UsersController < ApplicationController
    before_action :authenticate_member!, except: [:index]
    def index 
        users = User.all
        render json: users
        if user_signed_in?
        redirect_to  @user_path(current_user)
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
        user_signed_in?
        render :json => {"signed_in" => true, "user" => current_user}.to_json()
        user = User.find_by(params[:id])
        render json: user
    end
    def new 
        @user = user.new
    end
    def create 
        @user = user.create(user_params)
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
        params.require(:customer).permit(:firstName, :lastName, :role, :email, :username, :password, )
    end
end
