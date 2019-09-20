class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def index
    currentUser = current_user.id
    render json: currentUser
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
