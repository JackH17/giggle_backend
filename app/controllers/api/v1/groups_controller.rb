class Api::V1::GroupsController < ApplicationController
    skip_before_action :authorize, only: [:index]
    def create
        group = Group.create( group_params )
            if group.valid?
            render json: { group: GroupSerializer.new(group)}, status: :created
            # render json: { group: group, token: issue_token(group_id: group.id) }, status: :created
         else
            render json: { errors: group.errors.full_messages }, status: :not_accepted
         end
        end
    
         def index
             @groups = Group.all
             render json: { groups: @groups.map{ |group| GroupSerializer.new(group) }} 
        end
    
            private
    
            def group_params
            params.require(:group).permit(:name, :event_id, :user_id)
            end
end
