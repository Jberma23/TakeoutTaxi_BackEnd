# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    if request[:user]["token"]
      id = decode(request[:user]["token"])
      @user = User.find_by(id: id['user_id'])
    else 
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    end
    created_jwt = encode({user_id: @user.id})
    render json: {authenticated: true, user: UserSerializer.new(@user), token: created_jwt}
  end

  # DELETE /resource/sign_out
  def destroy # Assumes only JSON requests
      # cookies.delete(:jwt)
  end
  # def destroy
  #   super
  # end

  protected
  def after_sign_in_path_for(resource)
    session["http://localhost:3001"] = current_user
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
  devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    user_params.permit(:username, :email)
  end
  end
end
