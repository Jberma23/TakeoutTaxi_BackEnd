require 'byebug'

class SessionsController < ApplicationController
  def create
  
    success, user = User.valid_login?(params[:email], params[:password])
    if success
      token = encode({user_id: user.id})
      render json: {
      authenticated: true,
      message: "You are logging in...",
      user: UserSerializer.new(user),
      token: token
    }, status: :accepted
    else
      head :unauthorized
    end
  end

  def destroy
  end
end

