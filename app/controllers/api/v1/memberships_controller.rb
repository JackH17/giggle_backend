class Api::V1::MembershipsController < ApplicationController

    skip_before_action :authorize, only: [:create, :index, :show]

    def create
        membership = Membership.create( membership_params )
        if membership.valid?
            render json: { membership: MembershipSerializer.new(membership)}, status: :created
            # render json: { membership: membership, token: issue_token(user_id: membership.id) }, status: :created
        else
            render json: { errors: membership.errors.full_messages }, status: :not_accepted
        end
    end
    
    def index
      @memberships = Membership.all
      render json: { memberships: @memberships.map{ |membership| MembershipSerializer.new(membership) }} 
    end
    
    private
    
    def membership_params
      params.require(:membership).permit(:user_id, :group_id)
    end

end
