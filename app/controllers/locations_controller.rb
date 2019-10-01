require 'byebug'
class LocationsController < ApplicationController
  def create
    location = Location.create!(location_params)
    render json: location
  end

  def index
    locations = Location.all 
    render json:  Rails.application.credentials[:google][:api_key].to_json()
  end

  def new
    location = Location.find_by(id: params[:id])
    render json: location
  end
  private 
  def location_params 
    params.require(:location).permit(:latitude, :longitude)
  end
end
