class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show 
        render json: find_gym
    end
    
    def destroy 
        find_gym.destroy
        head :no_content
    end

    private 
    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end

    def find_gym
        Gym.find(params[:id])
    end

end
