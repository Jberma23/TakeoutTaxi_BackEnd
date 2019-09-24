# frozen_string_literal: true
require 'byebug'
class User::SessionsController < Devise::SessionsController
  attr_accessor :password 

  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json


  
  # GET /resource/sign_in
  

  # POST /resource/sign_in
  def create
    # super
    @user = User.find_by(email: params[:email])
    # byebug
    if @user && @user.authenticatable_salt()
      #if user exists and password is a match
      token = encode({user_id: @user.id})
      render json: {
        map: ENV["google_secret_access_key"],
        authenticated: true,
        message: "You are logging in...",
        user: @user,
        token: token
      }, status: :accepted
    else
      #if user does not exist OR password not a match
      render json: {
        authenticated: false,
        message: "INCORRECT! You are a fraud"
      }, status: :unauthorized
    end
   
  
    # self.resource = warden.authenticate!(auth_options)
    # set_flash_message!(:notice, :signed_in)
    # sign_in(resource_name, resource)
    # yield resource if block_given?
    # respond_with resource, location: after_sign_in_path_for(resource)
  end



#   def auth_options
#     { scope: resource_name, recall: "#{controller_path}#new" }
#   end

  
#   def after_sign_in_path_for(resource)
#     request.env['database_authenticatable'] || stored_location_for(resource) || root_path
#   end

#   protected

#   def after_update_path_for(resource)
#     user_path(resource)
#   end

#   def update_resource(resource, params)
#     resource.update_without_password(params)
#   end

#   def sign_up_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
#   end

#   def account_update_params
#     params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :avatar)
#   end
end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

