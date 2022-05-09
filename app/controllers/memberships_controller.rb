class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    def show 
        render json: find_membership
    end

    private 
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def find_membership
        Membership.find(params[:id])
    end

end
