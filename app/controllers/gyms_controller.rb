class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :gym_not_found

    def show 
        gym = Gym.find(params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find(params[:id])
        gym.destroy 
        head :no_content
    end

    private

    def gym_not_found
        render json: {error: "No gym Found"}, status: :not_found
    end
end
