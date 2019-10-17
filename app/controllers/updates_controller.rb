class UpdatesController < ApplicationController
    def index 
        updates = Update.all
        render json: updates
    end
    # def show 
    #     @update = Update.find_by(id: params[:id])
    #     render json: @update
    # end
    def new
        @update = Update.new
    end
    def create
    update = Update.create!(update_params)
    render json: update
    end

    private
    def update_params
        params.permit(:content, :feed_item, :update)
    end
end
