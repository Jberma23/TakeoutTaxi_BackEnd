
  def create # POST /api/v1/login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      token = encode({user_id: @user.id})
      render json: {
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
  end
