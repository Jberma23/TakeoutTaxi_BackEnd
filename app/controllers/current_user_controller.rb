
class CurrentUserController < ApplicationController
    before_action :authenticate_user, only: [:show]
    def show 
        byebug
    end 



    def authenticate_user       
        jwt = cookies.signed[:jwt]
        decode(jwt)
      end
end
