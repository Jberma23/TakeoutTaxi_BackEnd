class LocationsController < ApplicationController
  # before_action :authenticate_user
  def create
    location = Location.create!(location_params)
    render json: location
  end

  def index
    render json:  [Rails.application.credentials[:google][:api_key], Rails.application.credentials[:square][:access_key], Rails.application.credentials[:square][:application_id], 
    Rails.application.credentials[:square][:location_id]]
  end

  def new
    location = Location.find_by(id: params[:id])
    render json: location
  end
  private 
  def authenticate_user
    jwt = request.headers[:token]
    id = decode(jwt)
    current_user = User.find_by(id: id['user_id']) 
  end
  def location_params 
    params.require(:location).permit(:latitude, :longitude)
  end
end
