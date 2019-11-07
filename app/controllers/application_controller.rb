class ApplicationController < ActionController::API
  include ::ActionController::Cookies
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :authenticate_user!

    def secret_key
      'Richardm'
    end

    def authenticate_user
      jwt = cookies.signed[:jwt]
      decode(jwt)
    end
  
    # #given some payload, I want to  return a token
    def encode(payload)
      JWT.encode(payload, secret_key, 'HS512')
    end
  
    # #given a token, I want to return the original payload
    def decode(token)
      JWT.decode(token, secret_key, true, {algorithm: "HS512"})[0]
    end

    protected
    def after_sign_in_path_for(resource)
     
      session["http://localhost:3001"] = current_user
     
    end
   
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :firstName, :lastName, :username, :role])
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:username, :email)
      end
    end
 
end


#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
#   end
# end
# added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
# devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
# devise_parameter_sanitizer.permit :account_update, keys: added_attrs