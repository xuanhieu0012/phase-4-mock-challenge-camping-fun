class CampersController < ApplicationController
    before_action :get_camper, only: [:show]


    def index
        c = Camper.all
        render json: c.as_json(except: [:activities]), status: 200
    end

    def show
        if @camper
            render json: @camper, include: ['activities'], status: 200
        else
            
            render json: {error: "Camper not found"}, status: 404
        end
    end

    def create
        
        c = Camper.create(camper_params)
        if c.valid?
            render json: c, status: 201
        else
            
            render json: {errors: c.errors.full_messages}, status: 422
        end
    end

    private
    def get_camper
        @camper =Camper.find_by(id: params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end
end
