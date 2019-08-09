class Api::V1::DiscussionsController < ApplicationController

    skip_before_action :authorize, only: [:create, :index, :show]

    def create
        discussion = Discussion.create( discussion_params )
        if discussion.valid?
            render json: { discussion: DiscussionSerializer.new(discussion)}, status: :created
            # render json: { discussion: discussion, token: issue_token(user_id: discussion.id) }, status: :created
        else
            render json: { errors: discussion.errors.full_messages }, status: :not_accepted
        end
    end
    
    def index
      @discussions = Discussion.all
      render json: { discussions: @discussions.map{ |discussion| DiscussionSerializer.new(discussion) }} 
    end
    
    private
    
    def discussion_params
      params.require(:discussion).permit(:name, :group_id)
    end

end
