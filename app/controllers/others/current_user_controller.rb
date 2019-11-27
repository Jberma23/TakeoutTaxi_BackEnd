
class CurrentUserController < ApplicationController
    before_action :authenticate_user, only: [:show]
    def show 
        
    end 



    def authenticate_user       
        jwt = cookies.signed[:jwt]
        decode(jwt)
      end
end
