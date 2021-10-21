class ActivitiesController < ApplicationController

    def index
       render json: Activity.all, status: 200
    end

    def destroy
        a = Activity.find_by(id: params[:id])
        if a
            a.destroy
            render json: {}
        else
            render json: {error: "Activity not found"}, status: 404
        end
    end

end
