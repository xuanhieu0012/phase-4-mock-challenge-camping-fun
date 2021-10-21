class SignupsController < ApplicationController

    def create
        s = Signup.create(signup_params)
        if s.valid?
            render json: s.activity, status: :created
        else
            render json: {errors: s.errors.full_messages}, status: 422
        end
        
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
