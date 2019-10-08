

class SessionsController < ApplicationController
  # after_filter :set_csrf_headers, only: [:create, :destroy]
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

  protected
  # def set_csrf_headers
  #   cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?  
  # end
end

