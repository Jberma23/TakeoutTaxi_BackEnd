require 'byebug'
class ApplicationController < ActionController::API
  
    before_action :configure_permitted_parameters, if: :devise_controller?


    def secret_key
      'Richardm'
    end
  
    #given some payload, I want to  return a token
    def encode(payload)
      JWT.encode(payload, secret_key, 'HS512')
    end
  
    #given a token, I want to return the original payload
    def decode(token)
      JWT.decode(token, secret_key, true, {algorithm: "HS512"})[0]
    end
    
    protected
    def after_sign_in_path_for(resource)
     byebug
      session[:domain_prefix] = current_user.domain_prefix
      user_path(resource)
    end
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
 
end
